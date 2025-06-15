import 'package:advance_flutter_lab/Lab-3/controllers/Lab_3_A_2_controller.dart';
import 'package:flutter/material.dart';

class PersonsCRUDView extends StatefulWidget {
  const PersonsCRUDView({super.key});

  @override
  State<PersonsCRUDView> createState() => _PersonsCRUDViewState();
}

class _PersonsCRUDViewState extends State<PersonsCRUDView> {
  PersonDBController _personDBController = PersonDBController();
  TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CRUD With Database")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hint: Text("Name"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _personDBController.addUserInDB(name: _nameController.text);
              _personDBController.fetchPersons();
              setState(() {});
            },
            child: Text("Add Person"),
          ),
          Expanded(
            child:
                _personDBController.persons.isNotEmpty
                    ? ListView.builder(
                      itemCount: _personDBController.persons.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> person =
                            _personDBController.persons[index];
                        return ListTile(title: Text(person['name']));
                      },
                    )
                    : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_off_rounded,
                          size: 80,
                          color: Colors.black54,
                        ),
                        Text(
                          "No data to show!",
                          style: TextStyle(color: Colors.black54, fontSize: 30),
                        ),
                      ],
                    ),
          ),
        ],
      ),
    );
  }
}
