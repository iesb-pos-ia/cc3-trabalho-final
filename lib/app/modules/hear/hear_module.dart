import 'package:SpeechMaster/app/modules/hear/index/index_page.dart';
import 'package:SpeechMaster/app/shared/service/watson_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'index/index_controller.dart';

class HearModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => IndexController(service: i.get<WatsonService>())),
      ];

  @override
  List<Router> get routers => [
    Router('/', child: (_, args) => IndexPage())
  ];

  static Inject get to => Inject<HearModule>.of();
}
