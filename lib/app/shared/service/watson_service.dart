import 'dart:developer';

import 'package:SpeechMaster/app/shared/model/result_envelope_model.dart';
import 'package:SpeechMaster/app/shared/repository/watson_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WatsonService extends Disposable {

  final WatsonRepository repository;
  WatsonService({@required this.repository}) : assert(repository != null);

  @override
  void dispose() {
    log('Disposing [ WatsonService ]');
  }

  Future<ResultEnvelopeModel> sendAudio(String path) {
    return repository.sendAudio(path);
  }

  Future<String> getAudio({String fromText}) {
    return repository.getAudio(fromText: fromText);
  }

}
