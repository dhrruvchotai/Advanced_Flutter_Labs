import 'dart:convert';

import 'package:advance_flutter_lab/Lab-11/user_model.dart';
import 'package:http/http.dart' as http;

class UserApiService {
  String baseUrl = "https://6673d5f375872d0e0a93e612.mockapi.io/me/Dhruv/Users";

  Future<List<UserModel>> fetchData() async {
    try {
      final res = await http.get(Uri.parse(baseUrl));
      return List.from(jsonDecode(res.body)).map((user) {
        return UserModel.fromMap(user);
      }).toList();
    } catch (e) {
      print("Error in fetching data : $e");
    }
    return [];
  }
}
