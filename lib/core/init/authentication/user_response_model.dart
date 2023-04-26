class UserResponseModel {
  final String? token;
  final String? userId;
  final String? email;
  final bool hasError;
  final String? message;

  UserResponseModel({
    this.token,
    this.userId,
    this.email,
    this.message,
    required this.hasError,
  }) : assert(hasError ? message != null : true);
}
