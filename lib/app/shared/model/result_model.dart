import 'dart:convert';

import 'package:SpeechMaster/app/shared/model/alternative_model.dart';

class ResultModel {

  ResultModel({
    this.alternatives,
    this.resultFinal,
  });

  final List<AlternativeModel> alternatives;
  final bool resultFinal;

  factory ResultModel.fromRawJson(String str) => ResultModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
    alternatives: json["alternatives"] == null ? null : List<AlternativeModel>.from(json["alternatives"].map((x) => AlternativeModel.fromJson(x))),
    resultFinal: json["final"] == null ? null : json["final"],
  );

  Map<String, dynamic> toJson() => {
    "alternatives": alternatives == null ? null : List<dynamic>.from(alternatives.map((x) => x.toJson())),
    "final": resultFinal == null ? null : resultFinal,
  };

}
