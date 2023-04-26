import 'iauthentication.dart';
import 'user_response_model.dart';

class AuthenticationManager implements IAuthentication {
  static final AuthenticationManager _instance = AuthenticationManager._init();
  static AuthenticationManager get instance => _instance;

  AuthenticationManager._init();

  IAuthentication? _authentication;

  @override
  Future<void> init() async => _authentication?.init();

  @override
  Stream<bool> get authStateChanges => _authentication!.authStateChanges;

  @override
  Future<bool> get authStateChangesValue => _authentication!.authStateChangesValue;

  @override
  Future<UserResponseModel> get currentUser => _authentication!.currentUser;

  @override
  Future<UserResponseModel> login(String email, String password) async {
    return await _authentication!.login(email, password);
  }

  @override
  Future<bool> logout() async {
    return await _authentication!.logout();
  }

  @override
  Future<UserResponseModel> register(String email, String password) async {
    return await _authentication!.register(email, password);
  }

  @override
  Future<UserResponseModel> signInWithCustomToken() async {
    return await _authentication!.signInWithCustomToken();
  }
}
