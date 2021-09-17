import 'package:flutter/material.dart';
import './methods/homepage.dart';
import 'package:get/get.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Grocery Application",
        home: HomePage(),
       theme: ThemeData( primaryColor: Colors.green,
            canvasColor: Colors.green,
            accentColor: Colors.green,
            accentColorBrightness: Brightness.dark)
    );
  }
}
