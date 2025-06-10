import 'package:advance_flutter_lab/Lab-2/controllers/Lab_2_A_2_3_controller.dart';
import 'package:advance_flutter_lab/Lab-2/controllers/Lab_2_A_4_controller.dart';
import 'package:flutter/material.dart';

class ProfileCardView extends StatefulWidget {
  const ProfileCardView({super.key});

  @override
  State<ProfileCardView> createState() => _ProfileCardViewState();
}

class _ProfileCardViewState extends State<ProfileCardView> {
  UserSignUpController _userSignUpController = UserSignUpController();
  UserController _userController = UserController();
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Card Generator"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print("All details are valid!");
                  _userController.setUserDetails(
                    name: _name.text,
                    email: _email.text,
                    phone: _phone.text,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileCard()),
                  );
                }
              },
              child: Text(
                "Generate Card",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Card Generator"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Card(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(8.0, 8.0),
                  blurRadius: 3.0,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
            ),
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width / 5,
            child: Column(
              children: [
                SizedBox(height: 10),
                CircleAvatar(
                  radius: 25,
                  child: Icon(Icons.person, color: Colors.white),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                Divider(color: Colors.black),
                SizedBox(height: 10),
                ListTile(
                  leading: Icon(Icons.person_2_outlined),
                  title: Text("Name"),
                  subtitle: Text("Dhruv"),
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(Icons.email_outlined),
                  title: Text("Email"),
                  subtitle: Text("dhruv@gmail.com"),
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(Icons.phone_outlined),
                  title: Text("Phone"),
                  subtitle: Text("8320663837"),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
