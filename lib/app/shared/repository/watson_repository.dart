import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:SpeechMaster/app/shared/constants.dart';
import 'package:SpeechMaster/app/shared/model/result_envelope_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:path_provider/path_provider.dart';

class WatsonRepository extends Disposable {

  final Dio dio;
  WatsonRepository({@required this.dio}) : assert(dio != null);

  @override
  void dispose() {
    log('Disposing [ WatsonRepository ]');
  }


  String get _speakApiKeyHeader {
    var credential = 'apiKey:${Constants.Watson.Speak.ApiKey}';
    credential = Base64Codec.urlSafe().encode(credential.codeUnits);

    return 'Basic $credential';
  }

  String get _listenApiKeyHeader {
    var credential = 'apiKey:${Constants.Watson.Listen.ApiKey}';
    credential = Base64Codec.urlSafe().encode(credential.codeUnits);

    return 'Basic $credential';
  }


  Future<ResultEnvelopeModel> sendAudio(String path) async {
    try {
      final url = '${Constants.Watson.Speak.Url}/v1/recognize?model=pt-BR_BroadbandModel';
      final data = File(path).readAsBytesSync();
      final response = await dio.post(
        url,
        data: Stream.fromIterable(data.map((e) => [e])),
        options: Options(
          contentType: 'audio/wav',
          headers: { 'Authorization' : _speakApiKeyHeader }
        ),
      );

      return ResultEnvelopeModel.fromJson(response.data);
    }on DioError catch (error, stackTrace) {
      log(error.message);
    }
  }

  Future<String> getAudio({String fromText}) async {
    try {
      final url = '${Constants.Watson.Listen.Url}/v1/synthesize?voice=pt-BR_IsabelaV3Voice';

      final data = {
        'text': fromText
      };

      var filePath = (await getTemporaryDirectory()).path;
      filePath = '$filePath/retorno_${DateTime.now().millisecondsSinceEpoch}.ogg';
      final respose = await dio.download(
          url,
          filePath,
          data: json.encode(data),
          options: Options(
              method: 'post',
              contentType: 'application/json',
              headers: {'Accept' : 'audio/ogg', 'Authorization' : _listenApiKeyHeader}
          )
      );

      if (respose.statusCode == 200) {
        return filePath;
      }else {
        return null;
      }
    }on DioError catch (error, stackTrace) {
      log(error.message);
    }

  }

}
