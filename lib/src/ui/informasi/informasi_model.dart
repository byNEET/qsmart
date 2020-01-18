// To parse this JSON data, do
//
//     final informasiModel = informasiModelFromJson(jsonString);

import 'dart:convert';

import 'package:qsmart/src/service/systemcall.dart';

// InformasiModel informasiModelFromJson(String str) =>
//     InformasiModel.fromJson(json.decode(str));

String informasiModelToJson(InformasiModel data) => json.encode(data.toJson());

class InformasiModel {
  String id;
  String body;
  DateTime createat;
  DateTime updateat;
  bool published;
  String titel;

  InformasiModel(
      {this.id,
      this.body,
      this.createat,
      this.published,
      this.titel,
      this.updateat});

  factory InformasiModel.fromJson(String id, Map<dynamic, dynamic> json) =>
      InformasiModel(
        id: id,
        body: SystemCall.decodeFromBase64(json["body"]),
        createat: DateTime.parse(json["createat"]),
        updateat: DateTime.parse(json["updateat"]),
        published: json["published"],
        titel: json["titel"],
      );

  Map<String, dynamic> toJson() => {
        "body": SystemCall.encodetoBase64(body),
        "createat": DateTime.now().toIso8601String(),
        "updateat": DateTime.now().toIso8601String(),
        "published": false,
        "titel": titel,
      };

  Map<String, dynamic> toJsonEdit() => {
        "body": SystemCall.encodetoBase64(body),
        // "createat": DateTime.now().toIso8601String(),
        "updateat": DateTime.now().toIso8601String(),
        // "published": published,
        "titel": titel,
      };
}
