import '../../extension/all_extensions.dart';
import '../../init/localization/locale_keys.g.dart';

enum ErrorCodes {
  networkError,
}

extension StringExtension on ErrorCodes {
  String errorGlobalMessage(String errorNumber) {
    return "${LocaleKeys.global_errorOccurred.locale} ($toStr-$errorNumber)";
  }
}
