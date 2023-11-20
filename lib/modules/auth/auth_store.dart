import 'package:drikaprof/core/services/auth_service.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class AuthStore extends Store<int> {
  AuthStore() : super(0);

  final _authService = Modular.get<AuthServiceContract>();

  Future<String?>? authUser(LoginData loginData) async {
    await _authService.signIn(loginData.name, loginData.password);
    return null;
  }

  Future<String?>? signUpUser(SignupData signupData) async {
    await _authService.signUp(signupData.name!, signupData.password!,
        signupData.additionalSignupData!['name']!);
    return null;
  }

  Future<String?>? recoverPassword(String email) {
    return null;
  }
}
