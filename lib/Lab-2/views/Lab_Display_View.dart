import 'package:advance_flutter_lab/Lab-2/views/Lab_2_A_4_view.dart';
import 'package:advance_flutter_lab/Lab-2/views/Lab_2_A_5_view.dart';
import 'package:flutter/material.dart';

class LabDisplayView extends StatelessWidget {
  const LabDisplayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lab-2"), centerTitle: true),
      body: ListView(
        children: [
          ListTile(
            tileColor: Colors.grey,
            title: Text("Beauty Products App"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductsPageView()),
              );
            },
          ),
          SizedBox(height: 20),
          ListTile(
            tileColor: Colors.grey,
            title: Text("Profile Card View"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileCardView()),
              );
            },
          ),
        ],
      ),
    );
  }
}
