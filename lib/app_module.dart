import 'package:drikaprof/core/services/auth_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/about/about_module.dart';
import 'modules/auth/auth_module.dart';
import 'modules/auth/auth_store.dart';
import 'modules/home/home_module.dart';
import 'modules/lessons/lessons_guard.dart';
import 'modules/lessons/lessons_module.dart';
import 'modules/students/students_guard.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<AuthServiceContract>(AuthService.new);
    i.addSingleton(AuthStore.new);
  }

  @override
  void routes(r) {
    r.module('/', module: HomeModule(), transition: TransitionType.fadeIn);
    r.module('/about', module: AboutModule(), transition: TransitionType.fadeIn);
    r.module('/lessons', module: LessonsModule(), guards: [LessonsGuard()], transition: TransitionType.fadeIn);
    r.module('/students', module: LessonsModule(), guards: [StudentsGuard()], transition: TransitionType.fadeIn);
    r.module('/auth', module: AuthModule(), transition: TransitionType.fadeIn);
  }
}
