class DatabaseResponse<T> {
  final T? data;
  final String? errorMessage;
  final bool hasError;
  DatabaseResponse({
    this.data,
    this.errorMessage,
    required this.hasError,
  }) : assert(hasError ? errorMessage != null : true);
}
