import 'dart:developer';
import 'dart:io';

import 'package:SpeechMaster/app/shared/model/alternative_model.dart';
import 'package:SpeechMaster/app/shared/service/watson_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';

part 'index_controller.g.dart';

class IndexController = _IndexControllerBase with _$IndexController;

abstract class _IndexControllerBase with Store {

  final WatsonService service;
  _IndexControllerBase({@required this.service}) : assert(service != null);

  @observable
  bool isRecording = false;

  @observable
  bool hasPermission = false;

  @observable
  bool loading = false;

  @observable
  bool initializing = false;

  @observable
  List<AlternativeModel> alternatives;

  @action
  Future<void> checkRecordPermission() async {
    loading = true;
    hasPermission = await FlutterAudioRecorder.hasPermissions;
    loading = false;
  }

  FlutterAudioRecorder _recorder;


  @action
  Future<void> onRecord() async {
    alternatives = List();
    initializing = true;
    Directory tempDir = await getTemporaryDirectory();
    _recorder = FlutterAudioRecorder('${tempDir.path}/gravacao_${DateTime.now().millisecondsSinceEpoch}.wav', audioFormat: AudioFormat.WAV);
    await _recorder.initialized;
    await _recorder.start();
    isRecording = true;
    initializing = false;
  }

  @action
  Future<void> onStop() async {
    loading = true;
    final recording = await _recorder?.stop();
    final recordingFilePath = recording.path;
    log(recordingFilePath);
    await _sendAudio(atPath: recordingFilePath);
    isRecording = false;
    loading = false;
  }

  Future<void> _sendAudio({@required String atPath}) async {
    assert(atPath != null, 'Cadê o arquivo?');
    final result = await service.sendAudio(atPath);
    alternatives = result?.results?.first?.alternatives ?? List();
  }

}
