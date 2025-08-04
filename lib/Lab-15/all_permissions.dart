import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class AllPermissions extends StatelessWidget {
  const AllPermissions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Map<Permission, PermissionStatus> statuses =
              await [
                Permission.camera,
                // Permission.storage,
                Permission.location,
              ].request();

          if (statuses[Permission.camera]!.isGranted) {
            Get.snackbar(
              "Permission For Camera",
              "Granted",
              backgroundColor: Colors.green,
            );
          }
          // if (statuses[Permission.storage]!.isGranted) {
          //   Get.snackbar(
          //     "Permission For Storage",
          //     "Granted",
          //     backgroundColor: Colors.green,
          //   );
          // }
          if (statuses[Permission.location]!.isGranted) {
            Get.snackbar(
              "Permission For Location",
              "Granted",
              backgroundColor: Colors.green,
            );
          }
        },
        child: Icon(Icons.perm_identity),
      ),
    );
  }
}
