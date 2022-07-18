import 'dart:convert';
import 'package:asset_project_demo/core/validator.dart';
import 'package:asset_project_demo/model/type_model.dart';
import 'package:asset_project_demo/provider/type_provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class DropDownWidget extends StatefulWidget {
  const DropDownWidget({Key? key}) : super(key: key);

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {


  List typeData = [];

  String? typeId;

  final String url = "https://quremetestapi.herokuapp.com/api/asset/assetType";

//   Future <List<TypeModel>> getTypeData() async {
//   final response =
//       await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"),
// );
//   if (response.statusCode == 200) {
//     List jsonResponse = json.decode(response.body);
//       return jsonResponse.map((data) => TypeModel.fromJson(data)).toList();
//   } else {
//     throw Exception('Unexpected error occured!');
//   }
// }

  Future<String> getTypeData() async {
    var res = await http.get(Uri.parse(url));
    var resBody = json.decode(res.body) ;
    
    setState(() {
      typeData = resBody ;
    });

    print(resBody);
    return "Sucess";
  }

  @override
  void initState() {
    super.initState();
    getTypeData();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        value: typeId,
        validator: (value) => Validator.validateType(type: value!.toString()),
        hint: const Text('Choose Type *'),
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
        items: typeData.map((item) {
          return DropdownMenuItem(
              value: item.assetType.toString(), child: Text(item.assetType));
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            typeId = newValue as String?;
          });
        });
  }
}

 