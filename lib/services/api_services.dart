import 'dart:convert';

import 'package:asset_project_demo/model/asset_model.dart';
import 'package:http/http.dart' as http;

String baseUrl = "https://quremetestapi.herokuapp.com/api/asset";

class ApiService {
  Future<List<AssetModel>> getAllAssets() async {
    List<AssetModel> assetList = [];
    try {
      var request = http.Request('GET', Uri.parse('$baseUrl/saveasset'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var assetData = await response.stream.bytesToString();
        List<dynamic> asset = jsonDecode(assetData);
        for (var element in asset) {
          AssetModel model = AssetModel.fromJson(element);
          assetList.add(model);
        }
        return assetList;
      } else {
        // print(response.reasonPhrase);
        return [];
      }
    } catch (e) {
      throw Exception('Failedto load asset');
    }
  }

  Future<List<AssetModel>?> getById() async {
    var client = http.Client();

    var url = Uri.parse("$baseUrl/id");
    final response = await client.get(url);

    if (response.statusCode == 200) {
      var json = response.body;
      return assetModelFromJson(json);
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future sendAsset(
    assetNameController,
    assetTypeController,
    assetValueController,
    assetExpiryController,
    purchaseDateController,
    departmentController,
    // String assetGeoLocation,
    // String assetBarcode
  ) async {
    try {
      var request = http.Request('POST', Uri.parse('$baseUrl/saveasset'));
      request.body = {
        'assetName': assetNameController.text,
        'assetType': assetTypeController.toString(),
        'assetValue': assetValueController.text,
        'assetExpiry': assetExpiryController.toIso8601String(),
        'purchaseDate': purchaseDateController.toIso8601String(),
        'department': departmentController.text,
        //'assetGeoLocation': assetGeoLocation,
        // 'assetBarcode': assetBarcode,
      }.toString();

      var response = await request.send();

      if (response.statusCode == 201) {
        var assetData = await response.stream.bytesToString();
        List<dynamic> asset = json.decode(assetData);
        for (var element in asset) {
          AssetModel model = AssetModel.fromJson(element);
          asset.add(model);
        }
        return asset;
      } else {
        // print(response.reasonPhrase);
        return false;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future updateAsset(
    assetNameController,
    assetTypeController,
    assetValueController,
    assetExpiryController,
    purchaseDateController,
    departmentController,
  ) async {
    final url = Uri.parse("$baseUrl/UpdateAsset/:id");
    final response = await http.put(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'assetName': assetNameController.text,
          'assetType': assetTypeController.toString(),
          'assetValue': assetValueController.text,
          'assetExpiry': assetExpiryController.toIso8601String(),
          'purchaseDate': purchaseDateController.toIso8601String(),
          'department': departmentController.text,
          //'assetGeoLocation': assetGeoLocation,
          // 'assetBarcode': assetBarcode,
        }));

    if (response.statusCode == 200) {
      return AssetModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update data');
    }
  }

  Future<AssetModel> delete(String id) async {
    final http.Response response = await http.delete(Uri.parse('$baseUrl/id'));
    if (response.statusCode == 200) {
      return AssetModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete asset');
    }
  }
}
