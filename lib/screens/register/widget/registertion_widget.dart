import 'package:asset_project_demo/core/constants.dart';
import 'package:asset_project_demo/core/validator.dart';
import 'package:asset_project_demo/screens/register/widget/dropdown_widget.dart';
import 'package:asset_project_demo/services/api_services.dart';
import 'package:asset_project_demo/services/type_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegistrationDetails extends StatefulWidget {
  const RegistrationDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<RegistrationDetails> createState() => _RegistrationDetailsState();
}

class _RegistrationDetailsState extends State<RegistrationDetails> {
  ApiService apiService = ApiService();
  List<dynamic> response = [];
  final formKey = GlobalKey<FormState>();

  final assetNameController = TextEditingController();
  final assetTypeController = TextEditingController();
  final assetValueController = TextEditingController();
  final assetExpiryController = TextEditingController();
  final departmentController = TextEditingController();
  final purchaseDateController = TextEditingController();

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
          ),

          kHeight10,

          //assetType
       //  DropDownWidget(),
          DropdownButtonFormField(
              validator: (value) =>
                  Validator.validateType(type: value!.toString()),
              hint: const Text('Choose Type *'),
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
              items: 
             const [
              DropdownMenuItem(value: 'FURNITURE', child: Text('FURNITURE')),
              DropdownMenuItem(value: 'INVESTMENTS', child: Text('INVESTMENTS')),
              DropdownMenuItem(value:  'OFFICE_EQUIPMENT', child: Text( 'OFFICE_EQUIPMENT')),
              DropdownMenuItem(value: 'VEHICLES', child: Text('VEHICLES')),
              DropdownMenuItem(value: 'BUILDINGS', child: Text('BUILDINGS')),
              DropdownMenuItem(value: 'EQUIPMENT', child: Text('EQUIPMENT')),
              DropdownMenuItem(value: 'PLANT', child: Text('PLANT')),
              DropdownMenuItem(value: 'TOOLS_AND_MACHINERY', child: Text('TOOLS_AND_MACHINERY')),
              ],
              onChanged: (value) {
                setState(() {
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
            ),
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
            ),
          ),

          kHeight10,
          //assetValue
          TextFormField(
            controller: assetValueController,
           
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              hintText: 'Value',
            ),
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
                    if(formKey.currentState!.validate()){
                      final snackBar= SnackBar(content: Text('Submitting assets'));
                    try {
                      bool asset = await ApiService().sendAsset(
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
                    }
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
}
