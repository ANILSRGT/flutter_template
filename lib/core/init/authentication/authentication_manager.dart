import 'iauthentication.dart';

class AuthenticationManager {
  static final AuthenticationManager _instance = AuthenticationManager._init();
  static AuthenticationManager get instance => _instance;

  AuthenticationManager._init();

  IAuthentication? _authentication;

  Future<void> init() async => _authentication?.init();
}
