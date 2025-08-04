import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraPermenentDenied extends StatelessWidget {
  const CameraPermenentDenied({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var status = await Permission.camera.request();
          if (status.isGranted) {
            Get.snackbar(
              "Camera Permission",
              "Camera Permission Granted.",
              backgroundColor: Colors.green,
            );
          } else if (status.isPermanentlyDenied) {
            Get.snackbar(
              "Camera Permission",
              "Camera Permission Denied.",
              backgroundColor: Colors.red,
            );
            openAppSettings();
          }
        },
        child: Icon(Icons.camera_alt_outlined),
      ),
    );
  }
}
