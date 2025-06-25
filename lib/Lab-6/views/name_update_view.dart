import 'package:advance_flutter_lab/Lab-6/controllers/show_name_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NameUpdateView extends StatelessWidget {
  NameUpdateView({super.key});
  ShowNameController _showNameController = Get.put(ShowNameController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onChanged: (value) {
              _showNameController.updateName(value);
            },
          ),
          Obx(() => Text("Name is : ${_showNameController.name.value}")),
        ],
      ),
    );
  }
}
