import 'package:advance_flutter_lab/Lab-2/controllers/Lab_2_A_1_controller.dart';
import 'package:flutter/material.dart';

class UserFavUnFavView extends StatefulWidget {
  const UserFavUnFavView({super.key});

  @override
  State<UserFavUnFavView> createState() => _UserFavUnFavViewState();
}

class _UserFavUnFavViewState extends State<UserFavUnFavView> {
  UserFavUnFavController _userController = UserFavUnFavController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favourite - UnFavourite User"),),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                Map<String,dynamic> user = _userController.users[index];
                return ListTile(
                  title: Text(user["name"]),
                  trailing: IconButton(
                      onPressed: (){
                        setState(() {
                          _userController.makeUserFavUnFav(user["name"], !user["isFav"]);
                        });
                      },
                      icon: user["isFav"] == true ? Icon(Icons.favorite,color: Colors.red,) : Icon(Icons.favorite_border_rounded,color: Colors.red,)
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: _userController.users.length),
          ),
        ],
      )
    );
  }
}
