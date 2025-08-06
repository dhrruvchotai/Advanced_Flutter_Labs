import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class FileIoTry extends StatelessWidget {
  const FileIoTry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var status = await Permission.storage.request();
          if (status.isGranted) {
            Get.snackbar(
              "Storage Permission",
              "Storage Permission Granted.",
              backgroundColor: Colors.green,
            );
            Directory? dir = await getExternalStorageDirectory();
            print(dir!.path);
          } else if (status.isDenied) {
            Get.snackbar(
              "Storage Permission",
              "Storage Permission Denied.",
              backgroundColor: Colors.red,
            );
          }
        },
        child: Icon(Icons.storage_rounded),
      ),
    );
  }
}
