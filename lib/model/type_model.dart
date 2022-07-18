// To parse this JSON data, do
//
//     final typeModel = typeModelFromJson(jsonString);

import 'dart:convert';

TypeModel typeModelFromJson(String str) => TypeModel.fromJson(json.decode(str));

String typeModelToJson(TypeModel data) => json.encode(data.toJson());

class TypeModel {
  TypeModel({
    required this.assetType,
  });

  List<String> assetType;

  factory TypeModel.fromJson(Map<String, dynamic> json) => TypeModel(
        assetType: List<String>.from(json["assetType"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "assetType": List<dynamic>.from(assetType.map((x) => x)),
      };
}
