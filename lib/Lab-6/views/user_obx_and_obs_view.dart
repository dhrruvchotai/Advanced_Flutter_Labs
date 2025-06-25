import 'package:advance_flutter_lab/Lab-6/controllers/variable_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserObxAndObs extends StatelessWidget {
  UserObxAndObs({super.key});
  VariableController _controller = Get.put(VariableController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(() => Text("Value : ${_controller.number.value}")),
          ElevatedButton(
            onPressed: () {
              _controller.incrementNum();
            },
            child: Text("Increment"),
          ),
        ],
      ),
    );
  }
}
