import 'package:advance_flutter_lab/Lab-3/controllers/Lab_3_A_1_controller.dart';
import 'package:flutter/material.dart';

import '../models/Lab_3_A_1_model.dart';

class StudentCRUDView extends StatefulWidget {
  const StudentCRUDView({super.key});

  @override
  State<StudentCRUDView> createState() => _StudentCRUDViewState();
}

class _StudentCRUDViewState extends State<StudentCRUDView> {
  TextEditingController _personNameController = TextEditingController(
    text: "Person",
  );
  PersonCRUDController _personCRUDController = PersonCRUDController();
  late Person oldPerson;

  bool isEditOptionActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CRUD Operation",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal[200],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextFormField(
              controller: _personNameController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black54),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                setState(() {
                  Person person = Person(name: _personNameController.text);
                  if (isEditOptionActive) {
                    _personCRUDController.editPersonInList(oldPerson, person);
                    isEditOptionActive = false;
                    setState(() {});
                  } else {
                    _personCRUDController.addPersonInList(person);
                  }
                  _personNameController.clear();
                });
              });
            },
            child: Text(
              isEditOptionActive ? "Edit Person" : "Add Person",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[200]),
          ),
          _personCRUDController.isPersonsListEmpty()
              ? Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person_off_rounded,
                      size: 100,
                      color: Colors.black54,
                    ),
                    Text(
                      "No data to show!",
                      style: TextStyle(color: Colors.black54, fontSize: 25),
                    ),
                  ],
                ),
              )
              : Expanded(
                child: ListView.builder(
                  itemCount: _personCRUDController.persons.length,
                  itemBuilder: (context, index) {
                    Person person = _personCRUDController.persons[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(person.name),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isEditOptionActive = !isEditOptionActive;
                                  oldPerson = person;
                                  _personNameController.text = oldPerson.name;
                                });
                              },
                              icon: Icon(
                                Icons.edit_outlined,
                                color: Colors.black,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _personCRUDController.deletePersonFromList(
                                    person,
                                  );
                                });
                              },
                              icon: Icon(
                                Icons.delete_outline_rounded,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        tileColor: Colors.teal.withOpacity(0.2),
                      ),
                    );
                  },
                ),
              ),
        ],
      ),
    );
  }
}
