import 'dart:convert';

import 'package:SpeechMaster/app/shared/model/result_model.dart';

class ResultEnvelopeModel {
  ResultEnvelopeModel({
    this.results,
    this.resultIndex,
  });

  final List<ResultModel> results;
  final int resultIndex;

  factory ResultEnvelopeModel.fromRawJson(String str) => ResultEnvelopeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResultEnvelopeModel.fromJson(Map<String, dynamic> json) => ResultEnvelopeModel(
    results: json["results"] == null ? null : List<ResultModel>.from(json["results"].map((x) => ResultModel.fromJson(x))),
    resultIndex: json["result_index"] == null ? null : json["result_index"],
  );

  Map<String, dynamic> toJson() => {
    "results": results == null ? null : List<dynamic>.from(results.map((x) => x.toJson())),
    "result_index": resultIndex == null ? null : resultIndex,
  };
}
