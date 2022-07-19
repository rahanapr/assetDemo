import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:asset_project_demo/core/constants.dart';
import 'package:asset_project_demo/core/extracted.dart';
import 'package:asset_project_demo/screens/home/home_screen.dart';
import 'package:asset_project_demo/services/api_services.dart';
import 'package:flutter/material.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final assetNameController = TextEditingController();
  final assetTypeController = TextEditingController();
  final assetValueController = TextEditingController();
  final assetExpiryController = TextEditingController();
  final departmentController = TextEditingController();
  final purchaseDateController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   ApiService().getAllAssets();
  // }
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: formKey,
      body: Center(
        child: SizedBox(
          width: size.width * 0.7,
          height: size.height * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              textField(assetNameController, 'Name'),
              kHeight10,
              textField(assetTypeController, 'Type'),
              kHeight10,
              textField(assetValueController, 'Value'),
              kHeight10,
              textField(assetExpiryController, 'Expairy Date'),
              kHeight10,
              textField(departmentController, 'Department'),
              kHeight10,
              // textField(purchaseDateController, 'Purchase Date'),
              kHeight20,
              ElevatedButton(
                  onPressed: () async {
                    setState(() {
                    updateAsset();
                  });
                //     try {
                //  bool asset = await ApiService().updateAsset(
                //           assetNameController.text,
                //           assetTypeController.text,
                //           assetValueController.text,
                //           assetExpiryController.text,
                //           purchaseDateController.text,
                //           departmentController.text);
                //       if (asset) {
                //         Navigator.popAndPushNamed(context, 'home');
                //       } else {
                //         throw Exception('Failedto create asset');
                //       }
                //     } catch (e) {
                //       e.toString();
                //     }
                  },
                  child: const Text(
                    'Save',
                    style: textButtonStyle,
                  ))
            ],
          ),
        ),
      ),
    );
  }
  void updateAsset() async {
    if (formKey.currentState!.validate()) {
     
      final response = await http.put(
        Uri.parse(""),
        body: jsonEncode(<String, String>{
           'assetName': assetNameController.text,
        'assetType': assetTypeController.toString(),
        'assetValue': assetValueController.text,
        'assetExpiry': assetExpiryController.text,
        // 'purchaseDate': purchaseDateController.text,
        'department': departmentController.text,
        }),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Asset Updated'),
            content: const Text('Updated Successfully'),
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
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text("Couldn't Update"),
            content: const Text('Something went wrong'),
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
