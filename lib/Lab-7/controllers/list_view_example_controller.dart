import 'package:get/get.dart';

class ListViewExampleController extends GetxController {
  // RxList<String> lst = <String>[].obs;
  RxList<Map<String, dynamic>> lst = <Map<String, dynamic>>[].obs;
  int editIndex = -1;
  Rx<bool> isEditActive = false.obs;

  void addElementInList(String name) {
    Map<String, dynamic> mp = {};
    mp["name"] = name;
    mp["isFav"] = false;
    lst.add(mp);
  }

  void deleteItemsFromList(int index) {
    lst.removeAt(index);
  }

  void editItemInList(String new_name) {
    Map<String, dynamic> new_map = lst[editIndex];
    new_map["name"] = new_name;
    lst[editIndex] = new_map;
    // lst[editIndex]["name"] = new_name;
  }

  void updateFavStatus(bool new_fav_status) {
    Map<String, dynamic> new_map = lst[editIndex];
    new_map["isFav"] = new_fav_status;
    lst[editIndex] = new_map;
  }
}
