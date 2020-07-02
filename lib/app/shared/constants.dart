class Constants {

  static final Watson = _Watson();


}

class _Watson {

  final Speak = _WatsonSpeak();
  final Listen = _WatsonListen();
}

class _WatsonSpeak {

  final ApiKey = 'LFl_4OtiXeeed7Ei5v6OfaB-UcVEPFaZ4W0ZF5V2H76p';
  final Url = 'https://api.us-south.speech-to-text.watson.cloud.ibm.com/instances/4b69699e-8b8b-4da6-979b-4d644b10a547';

}

class _WatsonListen {

  final ApiKey = 'eoyre-O3GSUijXzUzUCbQr2M1iy0zwIzR-NaCKQpNa-m';
  final Url = 'https://api.us-south.text-to-speech.watson.cloud.ibm.com/instances/ba407d47-8688-466c-b340-f2a2aaf8bd07';

}