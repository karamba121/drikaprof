import 'package:drikaprof/core/services/auth_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StudentsGuard extends RouteGuard {
  StudentsGuard() : super(redirectTo: '/auth/');

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    final service = Modular.get<AuthServiceContract>();
    return service.isAuthenticated;
  }
}
