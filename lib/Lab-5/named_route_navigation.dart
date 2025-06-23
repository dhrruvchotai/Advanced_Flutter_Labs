import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NamedRouteNavigation extends StatelessWidget {
  const NamedRouteNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Hello"),
          ElevatedButton(
            onPressed: () {
              Get.toNamed("/other_screen");
            },
            child: Text("Other Page"),
          ),
        ],
      ),
    );
  }
}
