import 'package:TaskApp/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    showSemanticsDebugger: false,
    home: HomeScreen(),
  ));
}
