

import 'package:asset_project_demo/core/constants.dart';
import 'package:flutter/material.dart';
//Text Method
Text textData(String asset) => Text(asset, style: text);

//textfield
TextField textField(TextEditingController controller, String hintText) {
    return TextField(
            controller:controller ,
            decoration:InputDecoration(
              hintText:hintText,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
          );
  }