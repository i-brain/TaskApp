import 'package:TaskApp/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    theme: ThemeData(
      accentColor: Colors.white,
      primaryColor: Colors.white,
    ),
    showSemanticsDebugger: false,
    home: HomeScreen(),
  ));
}
