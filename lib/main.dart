import 'package:advance_flutter_lab/Lab-16/file_io_try.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: "/",
      // getPages: [
      //   GetPage(name: "/", page: () => NamedRouteNavigation()),
      //   GetPage(
      //     name: "/other_screen",
      //     page: () => OtherScreen(),
      //     middlewares: [LoginMiddleWare()],
      //     // transition: Transition.fadeIn,
      //   ),
      //   GetPage(name: "/login_screen", page: () => LoginScreen()),
      // ],
      home: FileIoTry(),
    ),
  );
}
