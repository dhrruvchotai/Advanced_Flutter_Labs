import 'package:advance_flutter_lab/Lab-5/login_screen.dart';
import 'package:advance_flutter_lab/Lab-5/named_route_navigation.dart';
import 'package:advance_flutter_lab/Lab-5/navigation_demo.dart';
import 'package:advance_flutter_lab/Lab-5/use_middleware.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => NamedRouteNavigation()),
        GetPage(
          name: "/other_screen",
          page: () => OtherScreen(),
          middlewares: [LoginMiddleWare()],
          // transition: Transition.fadeIn,
        ),
        GetPage(name: "/login_screen", page: () => LoginScreen()),
      ],
    ),
  );
}
