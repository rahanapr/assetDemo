import 'package:asset_project_demo/model/asset_model.dart';
import 'package:asset_project_demo/model/type_model.dart';
import 'package:asset_project_demo/services/api_services.dart';
import 'package:asset_project_demo/services/type_service.dart';
import 'package:flutter/material.dart';

class AssetProvider with ChangeNotifier{
List<AssetModel> assetList=[];
 void updateAssetModel(List<AssetModel> assetList){
  this.assetList=assetList;
    notifyListeners();
  }

}