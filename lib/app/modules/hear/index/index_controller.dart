import 'package:SpeechMaster/app/shared/service/watson_service.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';

part 'index_controller.g.dart';

class IndexController = _IndexControllerBase with _$IndexController;

abstract class _IndexControllerBase with Store {

  TextEditingController editingController;

  final WatsonService service;
  _IndexControllerBase({@required this.service}) : assert(service != null) {
    editingController = TextEditingController();
  }

  @observable
  String filePath;

  @observable
  bool loading = false;

  @observable
  bool isPlaying = false;

  AssetsAudioPlayer _audioPlayer;

  @action
  Future<void> send() async {
    filePath = null;
    if (await Permission.storage.isUndetermined) {
      await Permission.storage.request();
    }

    if (await Permission.storage.isGranted) {
      loading = true;
      filePath = await service.getAudio(fromText: editingController.text);
      play();
      loading = false;
    }
  }

  @action
  Future<void> play() async {
    if (_audioPlayer == null) {
      _audioPlayer = AssetsAudioPlayer.newPlayer();
      _audioPlayer.playerState.listen((event) {
        isPlaying = event == PlayerState.play;
      });
    }
    assert(filePath != null);
    await _audioPlayer.open(Audio.file(filePath), volume: 100, respectSilentMode: false, autoStart: false);
    _audioPlayer.play();
  }

  @action
  Future<void> stop() async {
    _audioPlayer?.stop();
  }

}
