import 'dart:io' show File, Platform;

import 'package:cropperx/cropperx.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb, Uint8List;
import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:image_picker/image_picker.dart';

import '../extension/all_extensions.dart'
    show ContextExtension, StringExtension, StringIconifyExtension, ThemeExtension;
import '../init/localization/locale_keys.g.dart';

class PentaImagePicker {
  static Future<Uint8List?> pickImage(BuildContext context, bool crop,
      [OverlayType cropType = OverlayType.circle]) async {
    List<String> allowedExtensions = ['jpg', 'png', 'jpeg'];
    Uint8List? imageFile;
    if (kIsWeb || Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: allowedExtensions,
        allowMultiple: false,
      );
      if (result != null) {
        if (kIsWeb && result.files.single.bytes != null) {
          imageFile = result.files.single.bytes!;
        } else if (result.files.single.path != null) {
          imageFile = await File(result.files.single.path!).readAsBytes();
        }
      }
    } else if (Platform.isAndroid || Platform.isIOS) {
      final ImageSource? source = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            scrollable: true,
            backgroundColor: context.colorScheme.primary,
            titleTextStyle: context.textTheme.titleLarge!.copyWith(
              color: context.colorScheme.onPrimary,
            ),
            contentTextStyle: context.textTheme.bodyLarge!.copyWith(
              color: context.colorScheme.onPrimary,
            ),
            iconColor: context.colorScheme.onPrimary,
            title: Text(LocaleKeys.global_utils_pentaImagePicker_selectImage.locale),
            actionsAlignment: MainAxisAlignment.center,
            actionsOverflowAlignment: OverflowBarAlignment.center,
            actions: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop(ImageSource.camera);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colorScheme.onPrimary,
                  foregroundColor: context.colorScheme.primary,
                ),
                icon: Mdi.camera.iconifyToIcon(context),
                label: Text(LocaleKeys.global_utils_pentaImagePicker_camera.locale),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop(ImageSource.gallery);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colorScheme.onPrimary,
                  foregroundColor: context.colorScheme.primary,
                ),
                icon: Mdi.image_multiple.iconifyToIcon(context),
                label: Text(LocaleKeys.global_utils_pentaImagePicker_gallery.locale),
              ),
            ],
            content: SingleChildScrollView(
              child: Text(LocaleKeys.global_utils_pentaImagePicker_selectImageFrom.locale),
            ),
          );
        },
      );

      if (source == null) return null;
      final res = await ImagePicker().pickImage(source: source);
      if (res == null) return null;
      bool isAllowed = allowedExtensions.any((element) => res.path.endsWith(element));
      if (!isAllowed) {
        await Future.delayed(Duration.zero, () async {
          await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                scrollable: true,
                insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                title: Text(LocaleKeys.global_utils_pentaImagePicker_error.locale),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      Text(
                        LocaleKeys.global_utils_pentaImagePicker_fileTypeError.localeWithArgs(
                          args: [res.path.split('.').last],
                        ),
                      ),
                      Text(
                        LocaleKeys.global_utils_pentaImagePicker_allowedFileTpes.localeWithArgs(
                          args: [allowedExtensions.join(', ')],
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text(LocaleKeys.global_utils_pentaImagePicker_ok.locale),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        });
        return null;
      }
      imageFile = await res.readAsBytes();
    }

    if (crop && imageFile != null) {
      await Future.delayed(Duration.zero, () async {
        imageFile = await cropImage(context, imageFile!, cropType);
      });
    }

    return imageFile;
  }

  static Future<Uint8List?> cropImage(BuildContext context, Uint8List image,
      [OverlayType overlayType = OverlayType.circle]) async {
    Uint8List? imageFile;

    await showDialog(
      context: context,
      builder: (context) {
        final cropperKey = GlobalKey(debugLabel: 'cropperKey');
        return Container(
          width: context.width,
          height: context.height,
          color: Colors.grey,
          child: Stack(
            children: [
              Stack(
                fit: StackFit.expand,
                children: [
                  Cropper(
                    cropperKey: cropperKey,
                    overlayType: overlayType,
                    zoomScale: 1.0,
                    image: Image.memory(image),
                  ),
                  IgnorePointer(
                    child: Align(
                      alignment: Alignment.center,
                      child: Mdi.arrow_expand_all.iconifyToIcon(
                        context,
                        color: Colors.black.withOpacity(0.5),
                        size: context.dynamicOrientationSize(0.2),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight - const Alignment(0.1, 0.1),
                child: FloatingActionButton(
                  child: Mdi.check.iconifyToFloatingActionIcon(context),
                  onPressed: () async {
                    imageFile = await Cropper.crop(cropperKey: cropperKey);
                    Future.delayed(Duration.zero, () {
                      Navigator.of(context).pop();
                    });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );

    return imageFile;
  }
}
