import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseGoogleSignInDemo extends StatefulWidget {
  FirebaseGoogleSignInDemo({super.key});

  @override
  State<FirebaseGoogleSignInDemo> createState() =>
      _FirebaseGoogleSignInDemoState();
}

class _FirebaseGoogleSignInDemoState extends State<FirebaseGoogleSignInDemo> {
  String? userEmail;
  String? userName;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  List users = [];
  bool isEdit = false;
  int editIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(controller: name),
          TextFormField(controller: email),
          ElevatedButton(
            onPressed: () async {
              FirebaseAuth _auth = FirebaseAuth.instance;
              final GoogleSignIn googleSignIn = GoogleSignIn.instance;
              await googleSignIn.initialize(
                clientId:
                    "861879247399-l2p3co53bbrrtejk3hakf0kv7e6u085t.apps.googleusercontent.com",
              );
              GoogleSignInAccount googleAccount = await googleSignIn
                  .authenticate(scopeHint: ['email']);
              print("Google Account Of User : ${googleAccount}");
              userEmail = googleAccount.email;
              userName = googleAccount.displayName;
              setState(() {});
              await getUsers();
            },
            child: Text("Sign In With Google"),
          ),
          ElevatedButton(
            onPressed: () async {
              if (isEdit) {
                await ediUser(editIndex);
                isEdit = false;
                editIndex = -1;
              } else {
                await FirebaseFirestore.instance.collection("users").add({
                  "username": name.text,
                  "email": email.text,
                });
                name.clear();
                email.clear();
                await getUsers();
              }
              setState(() {});
            },
            child: Text(isEdit ? "Edit User" : "Add User"),
          ),

          Expanded(
            child:
                users.isEmpty
                    ? Text("No Users!")
                    : ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(users[index].data()['username']),
                          subtitle: Text(users[index].data()['email']),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () async {
                                  await deleteUser(index);
                                },
                                icon: Icon(Icons.delete),
                              ),
                              IconButton(
                                onPressed: () {
                                  name.text = users[index].data()['username'];
                                  email.text = users[index].data()['email'];
                                  isEdit = true;
                                  editIndex = index;
                                  setState(() {});
                                },
                                icon: Icon(Icons.edit),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }

  Future<void> getUsers() async {
    print("Get Called");
    users.clear();
    showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection("users").get();
    for (var doc in snapshot.docs) {
      users.add(doc);
    }
    setState(() {});
    Navigator.pop(context);
    print(users);
  }

  Future<void> deleteUser(int index) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(users[index].id)
        .delete();
    await getUsers();
  }

  Future<void> ediUser(int index) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(users[index].id)
        .update({'username': name.text, 'email': email.text});
    name.clear();
    email.clear();
    await getUsers();
  }
}
