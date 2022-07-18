// To parse this JSON data, do
//
//     final assetModel = assetModelFromJson(jsonString);

import 'dart:convert';

List<AssetModel> assetModelFromJson(String str) =>
    List<AssetModel>.from(json.decode(str).map((x) => AssetModel.fromJson(x)));

String assetModelToJson(List<AssetModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AssetModel {
  AssetModel({
    required this.id,
    required this.assetId,
    required this.assetName,
    required this.assetType,
    required this.assetValue,
    required this.assetExpiry,
    required this.department,
    required this.assetGeoLocation,
    required this.assetBarcode,
    required this.assetStatus,
    required this.createdBy,
    required this.assetMaintainenceHistory,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.purchaseDate,
  });

  String id;
  String assetId;
  String assetName;
  String assetType;
  int assetValue;
  DateTime assetExpiry;
  String department;
  String assetGeoLocation;
  String assetBarcode;
  String assetStatus;
  String createdBy;
  List<AssetMaintainenceHistory> assetMaintainenceHistory;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  DateTime? purchaseDate;

  factory AssetModel.fromJson(Map<String, dynamic> json) => AssetModel(
        id: json["_id"],
        assetId: json["assetID"],
        assetName: json["assetName"],
        assetType: json["assetType"],
        assetValue: json["assetValue"],
        assetExpiry: DateTime.parse(json["assetExpiry"]),
        department: json["department"],
        assetGeoLocation: json["assetGeoLocation"],
        assetBarcode: json["assetBarcode"],
        assetStatus: json["assetStatus"],
        createdBy: json["createdBy"],
        assetMaintainenceHistory: List<AssetMaintainenceHistory>.from(
            json["assetMaintainenceHistory"]
                .map((x) => AssetMaintainenceHistory.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        purchaseDate: json["purchaseDate"] == null
            ? null
            : DateTime.parse(json["purchaseDate"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "assetID": assetId,
        "assetName": assetName,
        "assetType": assetType,
        "assetValue": assetValue,
        "assetExpiry": assetExpiry.toIso8601String(),
        "department": department,
        "assetGeoLocation": assetGeoLocation,
        "assetBarcode": assetBarcode,
        "assetStatus": assetStatus,
        "createdBy": createdBy,
        "assetMaintainenceHistory":
            List<dynamic>.from(assetMaintainenceHistory.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "purchaseDate":
            purchaseDate == null ? null : purchaseDate!.toIso8601String(),
      };
}

class AssetMaintainenceHistory {
  AssetMaintainenceHistory({
    required this.id,
  });

  String id;

  factory AssetMaintainenceHistory.fromJson(Map<String, dynamic> json) =>
      AssetMaintainenceHistory(
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
      };
}
