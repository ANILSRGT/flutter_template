import 'user_response_model.dart';

abstract class IAuthentication {
  Future<void> init();
  Future<UserResponseModel> get currentUser;
  Stream<bool> get authStateChanges;
  Future<bool> get authStateChangesValue;
  Future<UserResponseModel> login(String email, String password);
  Future<UserResponseModel> register(String email, String password);
  Future<bool> logout();
  Future<UserResponseModel> signInWithCustomToken();
}
