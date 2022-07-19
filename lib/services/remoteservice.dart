
import 'dart:convert';

import 'package:http/http.dart' as http;

class RemoteService{
  
Future<String>postAsset(Map<String,dynamic>data) async{
try{
  var response= await http.post(Uri.parse("https://quremetestapi.herokuapp.com/api/asset/saveasset"),
  body: jsonEncode(data)
  );
if(response.statusCode==200){
  print(response.body);
  return "success";
}else{
  return  "error";
}
}
catch(SocketException){

}return "error fetching data";
}



}