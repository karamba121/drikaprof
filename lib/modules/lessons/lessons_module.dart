import 'package:flutter_modular/flutter_modular.dart';

import 'lessons_page.dart';

class LessonsModule extends Module{
  @override
  void routes(r) {
    r.child('/', child: (context) => const LessonsPage());
  }
}