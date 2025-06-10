import 'package:advance_flutter_lab/Lab-2/controllers/Lab_2_A_2_3_controller.dart';
import 'package:flutter/material.dart';

class UserSignUpView extends StatefulWidget {
  const UserSignUpView({super.key});

  @override
  State<UserSignUpView> createState() => _UserSignUpViewState();
}

class _UserSignUpViewState extends State<UserSignUpView> {
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _name,
                decoration: InputDecoration(
                  label: Text("Name"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator:
                    (value) => _userSignUpController.validateName(_name.text),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _email,
                decoration: InputDecoration(
                  label: Text("Email"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator:
                    (value) => _userSignUpController.validateEmail(_email.text),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _phone,
                decoration: InputDecoration(
                  label: Text("Phone"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator:
                    (value) =>
                        _userSignUpController.validatePhoneNumber(_phone.text),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _password,
              validator:
                  (value) =>
                      _userSignUpController.validatePassword(_password.text),
              decoration: InputDecoration(
                label: Text("Password"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
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
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print("All details are valid!");
                }
              },
              child: Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
