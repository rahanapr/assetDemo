import 'package:asset_project_demo/core/constants.dart';
import 'package:asset_project_demo/core/extracted.dart';
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

  @override
  void initState() {
    super.initState();
    ApiService().getAllAssets();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
              textField(purchaseDateController, 'Purchase Date'),
              kHeight20,
              ElevatedButton(
                  onPressed: () async {
                    try {
                 bool asset = await ApiService().updateAsset(
                          assetNameController.text,
                          assetTypeController.text,
                          assetValueController.text,
                          assetExpiryController.text,
                          purchaseDateController.text,
                          departmentController.text);
                      if (asset) {
                        Navigator.popAndPushNamed(context, 'home');
                      } else {
                        throw Exception('Failedto create asset');
                      }
                    } catch (e) {
                      e.toString();
                    }
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
}
