import 'package:flutter_modular/flutter_modular.dart';

import 'students_page.dart';

class StudentsModule extends Module{
  @override
  void routes(r) {
    r.child('/', child: (context) => const StudentsPage());
  }
}