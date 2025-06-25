import 'package:advance_flutter_lab/Lab-6/controllers/timer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateTimeView extends StatelessWidget {
  DateTimeView({super.key});

  TimerController _timerController = Get.put(TimerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(() => Text("Current Time : ${_timerController.currentTime}")),
          ElevatedButton(
            onPressed: () {
              _timerController.updateTimer();
            },
            child: Text("Start"),
          ),
          ElevatedButton(
            onPressed: () {
              _timerController.stopTimer();
            },
            child: Text("Stop"),
          ),
        ],
      ),
    );
  }
}
