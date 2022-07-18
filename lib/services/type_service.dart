import 'dart:convert';

import 'package:asset_project_demo/model/type_model.dart';
import 'package:http/http.dart' as http;

Future<List<TypeModel>> fetchTypeData() async {
  final response = await http.get(
    Uri.parse("https://quremetestapi.herokuapp.com/api/asset/assetType"),
  );
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => TypeModel.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}
