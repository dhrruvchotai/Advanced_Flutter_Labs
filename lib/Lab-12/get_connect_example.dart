import 'package:get/get.dart';

class GetConnectExample extends GetConnect {
  Future<List<dynamic>> getUsers() async {
    try {
      final res = await get(
        "https://6673d5f375872d0e0a93e612.mockapi.io/me/Dhruv/Users",
      );
      print(res.body);
      return res.body;
    } catch (e) {
      print("Error in fetching users $e");
    }
    return [];
  }
}
