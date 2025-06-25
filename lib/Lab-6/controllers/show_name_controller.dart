import 'package:get/get.dart';

class ShowNameController extends GetxController {
  Rx<String> name = ''.obs;

  void updateName(value) {
    name.value = value;
  }
}
