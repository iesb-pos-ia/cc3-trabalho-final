import 'welcome/welcome_controller.dart';
import 'package:SpeechMaster/app/modules/index/index/index_page.dart';
import 'package:SpeechMaster/app/modules/index/welcome/welcome_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'index/index_controller.dart';

class IndexModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => WelcomeController()),
        Bind((i) => IndexController()),
      ];

  @override
  List<Router> get routers => [
    Router('/', child: (_, args) => WelcomePage()),
    Router('/index', child: (_, args) => IndexPage()),
  ];

  static Inject get to => Inject<IndexModule>.of();
}
