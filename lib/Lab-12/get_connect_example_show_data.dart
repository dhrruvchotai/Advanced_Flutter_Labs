import 'package:advance_flutter_lab/Lab-12/get_connect_example.dart';
import 'package:flutter/material.dart';

class GetConnectExampleShowData extends StatelessWidget {
  GetConnectExampleShowData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
            future: GetConnectExample().getUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data![index]["name"]),
                      );
                    },
                    itemCount: snapshot.data!.length,
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
