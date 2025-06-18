import 'package:advance_flutter_lab/Lab-4/getx_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: GetxWidgets(),
    ),
  );
}
