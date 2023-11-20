import 'package:flutter_modular/flutter_modular.dart';

import 'about_page.dart';

class AboutModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const AboutPage());
  }
}
