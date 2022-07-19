// import 'package:asset_project_demo/model/type_model.dart';
// import 'package:asset_project_demo/services/type_service.dart';
// import 'package:flutter/material.dart';

// class TypeProvider extends ChangeNotifier {
//   List<TypeModel?> type = [];
//   bool loading = false;

//   getTypData() async {
//     loading = true;
//     type = await fetchTypeData();
//     //await fetchData();
//     loading = false;

//     notifyListeners();
//   }
// }

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
//   // List<AssetModel> assetType = [];
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

class TypeProvider with ChangeNotifier{

List<TypeModel> type=[];
//  void updateAssetModel(List<AssetModel> assetType){
//     print('123');
//   this.assetType=assetType;
//     notifyListeners();
//   }

Future<List> getTypeData() async {

    try {
      var response = await http.get(Uri.parse('$baseUrl/saveasset'));
      if (response.statusCode == 200) {
       
        var assetData = response.body; // await response.stream.bytesToString();
        var assetlst = jsonDecode(assetData);

       type = await assetlst
            .map<TypeModel>((json) => TypeModel.fromJson(json))
            .toList();
               notifyListeners();
      /*   for (var element in asset) {
          AssetModel model = AssetModel.fromJson(element);
          assetType.add(model);
        } */
 print(type);
        return type;
     
      } else {
        // print(response.reasonPhrase);
        return [];
      }
    } catch (e) {
      throw Exception('Failedto load asset');
    }

     
  }

}