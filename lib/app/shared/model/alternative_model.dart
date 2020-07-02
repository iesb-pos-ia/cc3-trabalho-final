// To parse this JSON data, do
//
//     final alternativeModel = alternativeModelFromJson(jsonString);

import 'dart:convert';

class AlternativeModel {
  AlternativeModel({
    this.confidence,
    this.transcript,
  });

  final double confidence;
  final String transcript;

  factory AlternativeModel.fromRawJson(String str) => AlternativeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AlternativeModel.fromJson(Map<String, dynamic> json) => AlternativeModel(
    confidence: json["confidence"] == null ? null : json["confidence"].toDouble(),
    transcript: json["transcript"] == null ? null : json["transcript"],
  );

  Map<String, dynamic> toJson() => {
    "confidence": confidence == null ? null : confidence,
    "transcript": transcript == null ? null : transcript,
  };
}
