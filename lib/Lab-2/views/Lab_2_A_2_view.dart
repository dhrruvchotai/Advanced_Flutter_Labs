import 'package:advance_flutter_lab/Lab-2/controllers/Lab_2_A_2_controller.dart';
import 'package:flutter/material.dart';

class UserSignUpModel extends StatefulWidget {
  const UserSignUpModel({super.key});

  @override
  State<UserSignUpModel> createState() => _UserSignUpModelState();
}

class _UserSignUpModelState extends State<UserSignUpModel> {
  UserSignUpController _userSignUpController = UserSignUpController();
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirm_password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User SignUp Form")),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _name,
              decoration: InputDecoration(
                label: Text("Name"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) => _userSignUpController.validateName(_name.text, "Please enter your name!"),
            ),
            TextFormField(
              controller: _email,
              decoration: InputDecoration(
                label: Text("Email"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            TextFormField(
              controller: _phone,
              decoration: InputDecoration(
                label: Text("Phone"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            TextFormField(
              controller: _password,
              decoration: InputDecoration(
                label: Text("Password"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            TextFormField(
              controller: _confirm_password,
              decoration: InputDecoration(
                label: Text("Confirm Password"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: (){
                if(_formKey.currentState.){
                }
              },
              child: Text("Sign Up")),
          ],
        ),
      ),
    );
  }
}
