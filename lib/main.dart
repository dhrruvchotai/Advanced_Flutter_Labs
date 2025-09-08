import 'package:advance_flutter_lab/Lab-19/firebase_google_sign_in_demo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      home: FirebaseGoogleSignInDemo(),
    ),
  );
}
