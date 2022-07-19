import 'dart:convert';

import 'package:asset_project_demo/core/constants.dart';
import 'package:asset_project_demo/core/validator.dart';
import 'package:asset_project_demo/screens/home/home_screen.dart';
import 'package:asset_project_demo/services/api_services.dart';
import 'package:asset_project_demo/services/remoteservice.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class RegistrationDetails extends StatefulWidget {
  const RegistrationDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<RegistrationDetails> createState() => _RegistrationDetailsState();
}

class _RegistrationDetailsState extends State<RegistrationDetails> {
  final _listType = [
    'PROPERTY',
    'PLANT',
    'EQUIPMENT',
    'TOOLS_AND_MACHINERY',
    'FURNITURE',
    'INVESTMENTS',
    'OFFICE_EQUIPMENT',
    'VEHICLES',
    'BUILDINGS'
  ];

  String? _selected = 'PROPERTY';

  final formKey = GlobalKey<FormState>();
ApiService apiService=ApiService();
String? assetName;
String? department;
String? assetType;
String? assetValue;
String? assetExpiry;
String? purchaseDate;
  final assetNameController = TextEditingController();
  final assetTypeController = TextEditingController();
  final assetValueController = TextEditingController();
  final assetExpiryController = TextEditingController();
  final departmentController = TextEditingController();
  final purchaseDateController = TextEditingController();

  RemoteService remoteService=RemoteService();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Text(
            'REGISTER HERE',
            style: textStyle,
          ),

          kHeight10,

          //assetName
          TextFormField(
            controller: assetNameController,
            validator: (value) => Validator.validateName(name: value!),
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              hintText: 'Name *',
            ),
            onChanged: (val){
              assetName=val;
            },
          ),

          kHeight10,

          //assetType
          //  DropDownWidget(),
          DropdownButtonFormField(
              value: _selected,
              validator: (value) =>
                  Validator.validateType(type: value!.toString()),
              hint: const Text('Choose Type *'),
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
              items: _listType
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              // items: const [
              //   DropdownMenuItem(value: 'FURNITURE', child: Text('FURNITURE')),
              //   DropdownMenuItem(
              //       value: 'INVESTMENTS', child: Text('INVESTMENTS')),
              //   DropdownMenuItem(
              //       value: 'OFFICE_EQUIPMENT', child: Text('OFFICE_EQUIPMENT')),
              //   DropdownMenuItem(value: 'VEHICLES', child: Text('VEHICLES')),
              //   DropdownMenuItem(value: 'BUILDINGS', child: Text('BUILDINGS')),
              //   DropdownMenuItem(value: 'EQUIPMENT', child: Text('EQUIPMENT')),
              //   DropdownMenuItem(value: 'PLANT', child: Text('PLANT')),
              //   DropdownMenuItem(
              //       value: 'TOOLS_AND_MACHINERY',
              //       child: Text('TOOLS_AND_MACHINERY')),
              // ],
              onChanged: (newValue) {
                setState(() {
                  _selected = newValue as String?;
                });
              }),

          kHeight10,

          //purchaseDate
          TextFormField(
            controller: purchaseDateController,
            onTap: () async {
              DateTime? pickDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1990),
                  lastDate: DateTime(3000));
              if (pickDate != null) {
                setState(() {
                  purchaseDateController.text =
                      DateFormat('dd-MM-yyyy').format(pickDate);
                });
              }
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.calendar_month),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              hintText: 'Purchase Date',
            ),onChanged: (val){
              purchaseDate=val;
            },
          ),

          kHeight10,
          //ExpairyDate
          TextFormField(
            onTap: () async {
              DateTime? pickDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1990),
                  lastDate: DateTime(3000));
              if (pickDate != null) {
                setState(() {
                  assetExpiryController.text =
                      DateFormat('dd-MM-yyyy').format(pickDate);
                });
              }
            },
            controller: assetExpiryController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.calendar_month),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              hintText: 'Expairy Date',
            ),onChanged: (val){
              assetExpiry=val;
            },
          ),

          kHeight10,
          //assetValue
          TextFormField(
            controller: assetValueController,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              hintText: 'Value',
            ),onChanged: (val){
              assetValue=val;
            },
          ),

          kHeight10,

          //department
          TextFormField(
            controller: departmentController,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              hintText: 'Department',
            ),
            onChanged: (val){
             department=val;
            },
          ),
          //assetGeolocation
          //assetBarcode

          kHeight20,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, 'home');
                  },
                  child: const Text(
                    'Back',
                    style: textButtonStyle,
                  )),
              ElevatedButton(
                  onPressed: () async {
                         createAsset();
                //         Map<String,dynamic> data={
                //          "assetName":assetName,
                //          "assetValue":assetValue,
                //          "assetExpiry":assetExpiry,
                //          "department":department,
                //          "purchaseDate":purchaseDate,
                //          "assetType":_selected,

                //         };
                //  String res=await remoteService.postAsset(data);
                //  res=="success"? const SnackBar(content:  Text("created"))
                //  :const SnackBar(content: Text('Error'));
                //  Navigator.popAndPushNamed(context, 'home');
                //  setState(() {
                //   
                //  });
                  },
                  child: const Text(
                    'Submit',
                    style: textButtonStyle,
                  )),
            ],
          ),
        ],
      ),
    );
  }
  void createAsset() async {
    if (formKey.currentState!.validate()) {
      final response = await http.post(
        Uri.parse("https://quremetestapi.herokuapp.com/api/asset/saveasset"),
        body: jsonEncode(<String, String>{
           'assetName': assetNameController.text,
        'assetType': assetTypeController.toString(),
        'assetValue': assetValueController.text,
        'assetExpiry': assetExpiryController.text.toString(),
        'purchaseDate': purchaseDateController.text.toString(),
        'department': departmentController.text,
        //'assetGeoLocation': assetGeoLocation,
        // 'assetBarcode': assetBarcode,
        }),
      );
      print(response.statusCode);
      if (response.statusCode == 201) {
      var post=response.body;
      print(post);
        print('sucess');
        
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Resident Registered'),
            content: const Text('Registration Successful'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                             HomeScreen()));
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        print("not getting data");
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Error Registration'),
            content: const Text('Something error happend'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } else {
     
      return;
    }
  }
}
