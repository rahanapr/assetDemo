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
     this.id,
     this.assetId,
     this.assetName,
     this.assetType,
     this.assetValue,
     this.assetExpiry,
     this.department,
     this.assetGeoLocation,
     this.assetBarcode,
     this.assetStatus,
     this.createdBy,
    //required this.assetMaintainenceHistory,
     this.createdAt,
     this.updatedAt,
     this.v,
     this.purchaseDate,
  });

  final String? id;
  final String? assetId;
  final String? assetName;
  final String? assetType;
  final int? assetValue;
  final DateTime? assetExpiry;
  final String? department;
  final String? assetGeoLocation;
  final String? assetBarcode;
  final String? assetStatus;
  final String? createdBy;
  //List<AssetMaintainenceHistory> assetMaintainenceHistory;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final DateTime? purchaseDate;

  factory AssetModel.fromJson(Map<String, dynamic> json) { return AssetModel(
        id: json["_id"],
        assetId: json["assetID"],
        assetName: json["assetName"],
        assetType: json["assetType"],
        assetValue: json["assetValue"],
        //assetExpiry: DateTime.parse(json["assetExpiry"]),
        department: json["department"],
        assetGeoLocation: json["assetGeoLocation"],
        assetBarcode: json["assetBarcode"],
        assetStatus: json["assetStatus"],
        createdBy: json["createdBy"],
        //assetMaintainenceHistory: List<AssetMaintainenceHistory>.from(
           // json["assetMaintainenceHistory"]
               // .map((x) => AssetMaintainenceHistory.fromJson(x))),
        //createdAt: DateTime.parse(json["createdAt"]),
        //updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        //purchaseDate: json["purchaseDate"] == null
           // ? null
           // : DateTime.parse(json["purchaseDate"]),
      );
  }
  Map<String, dynamic> toJson() => {
        "_id": id,
        "assetID": assetId,
        "assetName": assetName,
        "assetType": assetType,
        "assetValue": assetValue,
        "assetExpiry": assetExpiry,
        "department": department,
        "assetGeoLocation": assetGeoLocation,
        "assetBarcode": assetBarcode,
        "assetStatus": assetStatus,
        "createdBy": createdBy,
        //"assetMaintainenceHistory":
        //    List<dynamic>.from(assetMaintainenceHistory.map((x) => x.toJson())),
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
