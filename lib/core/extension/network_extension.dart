part of 'all_extensions.dart';

extension NetworkExtension on Map<String, dynamic>? {
  String get toStrJson => json.encode(this);
}
