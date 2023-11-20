import 'package:drikaprof/modules/auth/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final AuthStore store = Modular.get<AuthStore>();
  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<AuthStore, int>(
      store: store,
      onError: (context, error) => Center(child: Text('opa, $error')),
      onLoading: (context) => const Center(child: CircularProgressIndicator()),
      onState: (context, state) => FlutterLogin(
        title: 'Professora Drika',
        onLogin: store.authUser,
        onSignup: store.signUpUser,
        additionalSignupFields: const [
          UserFormField(keyName: 'name'),
        ],
        onSubmitAnimationCompleted: () => Modular.to.navigate('/'),
        onRecoverPassword: store.recoverPassword,
      ),
    );
  }
}
