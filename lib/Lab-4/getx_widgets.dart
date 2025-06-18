import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxWidgets extends StatelessWidget {
  const GetxWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Getx", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                  backgroundColor: Colors.black,
                  title: "Hello",
                  titleStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  middleText: "Hello Dialog!!",
                  middleTextStyle: TextStyle(color: Colors.white),
                  confirm: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green.withOpacity(0.3),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Confirm",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                  cancel: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red.withOpacity(0.2),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
              child: Text("Show Dialog", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  "Hello",
                  "Hello From Snackbar!!",
                  icon: Icon(Icons.pedal_bike),
                  snackPosition: SnackPosition.TOP,
                  backgroundGradient: LinearGradient(
                    colors: [Colors.indigo, Colors.indigoAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
              child: Text(
                "Show Snackbar",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Get.bottomSheet(
                  enterBottomSheetDuration: Duration(seconds: 3),
                  exitBottomSheetDuration: Duration(seconds: 3),
                  backgroundColor: Colors.black.withOpacity(0.8),
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Center(child: Text("Tile ${index + 1}")),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
                await Future.delayed(Duration(seconds: 10));
                Get.back();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
              child: Text(
                "Show Bottom Sheet",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 100,
              width: 150,
              child: Center(
                child: Text(
                  "Glass Morphic",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.white, offset: Offset(10, 20)),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(10, 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
