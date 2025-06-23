import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PassDataBetweenScreens extends StatelessWidget {
  const PassDataBetweenScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Get.to(ShowDataScreen(), arguments: "Hello");
            },
            child: Text("Other Screen"),
          ),
        ],
      ),
    );
  }
}

class ShowDataScreen extends StatelessWidget {
  ShowDataScreen({super.key});
  String? data;

  @override
  Widget build(BuildContext context) {
    this.data = Get.arguments;
    return Scaffold(body: Column(children: [Text("data is $data")]));
  }
}
