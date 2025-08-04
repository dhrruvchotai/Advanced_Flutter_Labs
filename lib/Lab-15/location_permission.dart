import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationPermission extends StatelessWidget {
  const LocationPermission({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var status = await Permission.location.request();
          if (status.isGranted) {
            Get.snackbar(
              "Location Permission",
              "Location Permission Granted.",
              backgroundColor: Colors.green,
            );
          } else if (status.isDenied) {
            Get.snackbar(
              "Location Permission",
              "Location Permission Denied.",
              backgroundColor: Colors.red,
            );
          }
        },
        child: Icon(Icons.location_on_outlined),
      ),
    );
  }
}
