import 'package:advance_flutter_lab/Lab-10/user_database_controller.dart';
import 'package:advance_flutter_lab/Lab-10/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserCrudView extends StatelessWidget {
  UserCrudView({super.key});

  UserDatabaseController userDatabaseController = Get.put(
    UserDatabaseController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User CRUD View")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: userDatabaseController.nameController,
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(height: 2),
          ElevatedButton(
            onPressed: () async {
              if (userDatabaseController.isEditActive.value) {
                await userDatabaseController.editUser(
                  MyUser.fromMap({
                    "id": userDatabaseController.editId,
                    "name": userDatabaseController.nameController.text,
                  }),
                );
              } else {
                await userDatabaseController.addUser(
                  MyUser.fromMap({
                    "user": userDatabaseController.nameController.text,
                  }),
                );
              }
            },
            child: Obx(
              () => Text(
                userDatabaseController.isEditActive.value
                    ? "Edit User"
                    : "Add User",
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Obx(
              () => ListView.separated(
                itemBuilder: (context, index) {
                  MyUser user = userDatabaseController.users[index];
                  return ListTile(title: Text(user.name));
                },
                separatorBuilder: (context, index) {
                  return Divider(thickness: 2);
                },
                itemCount: userDatabaseController.users.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
