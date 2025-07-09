import 'package:advance_flutter_lab/Lab-11/user_model_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisplayUsersView extends StatelessWidget {
  DisplayUsersView({super.key});

  UserModelController userModelController = Get.put(UserModelController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Data From Api")),
      body: Obx(
        () =>
            userModelController.users.isEmpty
                ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person_off, size: 100, color: Colors.grey),
                      Text(
                        "No Users!",
                        style: TextStyle(color: Colors.grey, fontSize: 30),
                      ),
                    ],
                  ),
                )
                : Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(userModelController.users[index].name),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(thickness: 2);
                    },
                    itemCount: userModelController.users.length,
                  ),
                ),
      ),
    );
  }
}
