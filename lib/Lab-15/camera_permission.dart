import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraPermission extends StatelessWidget {
  const CameraPermission({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var status = await Permission.camera.request();
          if (status.isGranted) {
            Get.snackbar("Camera Permission", "Camera Permission Granted.");
          }
        },
        child: Icon(Icons.camera_alt_outlined),
      ),
    );
  }
}
