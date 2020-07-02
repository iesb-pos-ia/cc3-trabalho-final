import 'dart:convert';
import 'dart:developer';

import 'package:SpeechMaster/app/shared/constants.dart';
import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import 'package:flutter/foundation.dart';

class Http {
  static String baseURL;
  static Dio _dio;

  static Dio dio() {
    if (_dio != null) return _dio;

    BaseOptions options = BaseOptions();

    options.connectTimeout = 30000;
    options.receiveTimeout = 60000;
    options.sendTimeout = 60000;
    options.followRedirects = true;
    options.receiveDataWhenStatusError = true;
    if (baseURL != null && baseURL.isNotEmpty) {
      options.baseUrl = baseURL;

      options.headers = {
        'Cache-Control': 'no-cache',
      };
    }

    _dio = Dio(options);
    _dio.transformer = FlutterTransformer();
    if (!kReleaseMode) {
      _dio.interceptors.add(LogInterceptor());
    }

    _dio.interceptors.add(InterceptorsWrapper(
        onError: _onError
    ));

    return _dio;
  }

  static Future<DioError> _onError(DioError error) async {
    log(error.message, name: 'Request error', level: 2000, error: error);
    return error;
  }
}