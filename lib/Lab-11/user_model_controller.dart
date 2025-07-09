import 'package:advance_flutter_lab/Lab-11/user_api_service.dart';
import 'package:advance_flutter_lab/Lab-11/user_model.dart';
import 'package:get/get.dart';

class UserModelController extends GetxController {
  RxList<UserModel> _users = <UserModel>[].obs;
  UserApiService userApiService = UserApiService();
  RxStatus status = RxStatus.loading();

  @override
  void onInit() async {
    super.onInit();
    fetchData();
  }

  RxList<UserModel> get users => _users;

  set users(RxList<UserModel> value) {
    _users = value;
  }

  Future<void> fetchData() async {
    _users.value = await userApiService.fetchData();
    status = RxStatus.success();
  }
}
