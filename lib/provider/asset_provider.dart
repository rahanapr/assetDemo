// import 'package:asset_project_demo/model/asset_model.dart';
// import 'package:asset_project_demo/model/type_model.dart';
// import 'package:asset_project_demo/services/api_services.dart';
// import 'package:asset_project_demo/services/type_service.dart';
// import 'package:flutter/material.dart';

// class AssetProvider with ChangeNotifier {
//   List<AssetModel> asset=[];
//  bool loading = false;
 
  

//   getData() async {
//     loading = true;
//     asset = await fetchData();
//     //await fetchData();
//     loading = false;

//     notifyListeners();
//   }
//   // List<AssetModel> assetList = [];
//   // void updateAssetModel(List<AssetModel> assetList) {
//   //   this.assetList = assetList;
//   //   notifyListeners();
//   // }
// }

import 'dart:convert';

import 'package:asset_project_demo/model/asset_model.dart';
import 'package:asset_project_demo/model/type_model.dart';
import 'package:asset_project_demo/services/api_services.dart';
import 'package:asset_project_demo/services/type_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AssetProvider with ChangeNotifier{

List<AssetModel> assetList=[];
 void updateAssetModel(List<AssetModel> assetList){
    print('123');
  this.assetList=assetList;
    notifyListeners();
  }

Future<List> getAllAssets() async {

    try {
      var response = await http.get(Uri.parse('$baseUrl/saveasset'));//http.Request('GET', Uri.parse('$baseUrl/saveasset'));

     // http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
       
        var assetData = response.body; // await response.stream.bytesToString();
        var assetlst = jsonDecode(assetData);

        assetList = await assetlst
            .map<AssetModel>((json) => AssetModel.fromJson(json))
            .toList();
               notifyListeners();
      /*   for (var element in asset) {
          AssetModel model = AssetModel.fromJson(element);
          assetList.add(model);
        } */
 print(assetList);
        return assetList;
     
      } else {
        // print(response.reasonPhrase);
        return [];
      }
    } catch (e) {
      throw Exception('Failed to load asset');
    }

     
  }


}