import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    bool isLogin = false;
    if (!isLogin) {
      return RouteSettings(name: "login_screen");
    }
  }
}
