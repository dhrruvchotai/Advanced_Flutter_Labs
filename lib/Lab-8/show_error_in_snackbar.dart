import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowErrorInSnackbar extends StatefulWidget {
  const ShowErrorInSnackbar({super.key});

  @override
  State<ShowErrorInSnackbar> createState() => _ShowErrorInSnackbarState();
}

class _ShowErrorInSnackbarState extends State<ShowErrorInSnackbar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            int a = 10;
            int b = 0;
            try {
              print("a/b is ${a ~/ b}");
            } catch (e) {
              Get.snackbar("Error Can Not Divide By Zero", e.toString());
            }
          },
          child: Text("Show Error"),
        ),
      ],
    );
  }
}
