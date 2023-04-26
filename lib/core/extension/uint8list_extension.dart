part of 'all_extensions.dart';

extension Uint8ListExtension on Uint8List {
  String get toStr => String.fromCharCodes(this);
}

extension StringUint8ListExtension on String {
  Uint8List get toUint8List => Uint8List.fromList(codeUnits);
}
