import 'package:asset_project_demo/model/type_model.dart';
import 'package:asset_project_demo/services/type_service.dart';
import 'package:flutter/material.dart';


class TypeProvider extends ChangeNotifier {
 List<TypeModel?> type=[];
 bool loading = false;
 
  

  getTypeData() async {
    type = await fetchTypeData();
    //await fetchData();

    notifyListeners();
  }

}