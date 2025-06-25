import 'dart:async';

import 'package:get/get.dart';

class TimerController extends GetxController {
  Rx<DateTime> currentTime = DateTime.now().obs;
  Timer? timer;

  void updateTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      currentTime.value = DateTime.now();
    });
  }

  void stopTimer() {
    timer!.cancel();
  }
}
