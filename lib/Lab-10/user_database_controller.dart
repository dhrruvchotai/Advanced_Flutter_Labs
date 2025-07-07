import 'package:advance_flutter_lab/Lab-10/user_database_service.dart';
import 'package:advance_flutter_lab/Lab-10/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UserDatabaseController extends GetxController {
  UserDataBaseService userDataBaseService = UserDataBaseService();
  RxList<MyUser> users = <MyUser>[].obs;
  TextEditingController nameController = TextEditingController();
  RxBool isEditActive = false.obs;
  int editId = -1.obs;

  @override
  void onInit() async {
    super.onInit();
    await userDataBaseService.initDatabase();
  }

  Future<void> fetchUsers() async {
    users.value = await userDataBaseService.fetchUsers();
  }

  Future<void> addUser(MyUser user) async {
    await userDataBaseService.addUser(user);
    await fetchUsers();
  }

  Future<void> editUser(MyUser user) async {
    await userDataBaseService.editUser(user);
    await fetchUsers();
  }

  Future<void> deleteUser({required int id}) async {
    await userDataBaseService.deleteUser(id: id);
    await fetchUsers();
  }
}
