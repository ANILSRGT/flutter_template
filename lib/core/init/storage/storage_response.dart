class StorageResponse<T> {
  final T? data;
  final String? message;
  final bool hasError;
  StorageResponse({
    this.data,
    this.message,
    required this.hasError,
  }) : assert(hasError ? message != null : true);
}
