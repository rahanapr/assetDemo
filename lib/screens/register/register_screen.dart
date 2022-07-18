
import 'package:asset_project_demo/core/constants.dart';
import 'package:asset_project_demo/screens/register/widget/image_widget.dart';
import 'package:asset_project_demo/screens/register/widget/registertion_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: const [
            ResponsiveVisibility(
                visible: false,
                visibleWhen: [Condition.largerThan(name: MOBILE)],
                child: ImageWidget()),
            kWidth20,
            Expanded(child: RegistrationDetails()),
          ],
        ),
      ),
    );
  }
}