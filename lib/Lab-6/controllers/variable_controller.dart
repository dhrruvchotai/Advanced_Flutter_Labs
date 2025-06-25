import 'package:get/get.dart';

class VariableController extends GetxController {
  RxInt number = 0.obs;

  void incrementNum() {
    number.value++;
  }
}
