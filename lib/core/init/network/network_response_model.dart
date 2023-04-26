class NetworkResponseModel {
  final bool hasError;
  final int statusCode;
  final String statusMessage;
  final Map<String, dynamic>? data;

  NetworkResponseModel({
    required this.hasError,
    required this.statusCode,
    required this.statusMessage,
    this.data,
  });
}
