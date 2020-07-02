import 'shared/service/watson_service.dart';
import 'package:SpeechMaster/app/app_widget.dart';
import 'package:SpeechMaster/app/modules/index/index_module.dart';
import 'package:SpeechMaster/app/shared/http.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'shared/repository/watson_repository.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Http.dio()),
        Bind((i) => AppController()),
        Bind((i) => WatsonRepository(dio: i.get<Dio>())),
        Bind((i) => WatsonService(repository: i.get<WatsonRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: IndexModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
