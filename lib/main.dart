import 'package:asset_project_demo/core/colors.dart';
import 'package:asset_project_demo/provider/asset_provider.dart';
import 'package:asset_project_demo/provider/type_provider.dart';
import 'package:asset_project_demo/screens/home/home_screen.dart';
import 'package:asset_project_demo/screens/home/widget/update_screen.dart';
import 'package:asset_project_demo/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => AssetProvider()),
        ChangeNotifierProvider(
            create: (BuildContext context) => TypeProvider()),
      ],
      child: MaterialApp(
        builder: (context, widget) => ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, widget!),
            breakpoints: [
              const ResponsiveBreakpoint.resize(300, name: MOBILE),
              const ResponsiveBreakpoint.resize(800, name: DESKTOP),
            ]),
        debugShowCheckedModeBanner: false,
        title: 'Asset Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          scaffoldBackgroundColor: backgroundColor,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(primary: themeColor)),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home:  HomeScreen(),
        routes: {
          'home': (context) =>  HomeScreen(),
          'register': (context) => RegisterScreen(),
          'update': (context) => UpdateScreen(),
        },
      ),
    );
  }
}
