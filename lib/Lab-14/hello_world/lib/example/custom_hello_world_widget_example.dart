import 'package:flutter/material.dart';
import 'package:hello_world/hello_world.dart';

void main() {
  runApp(MaterialApp(home: CustomHelloWorldWidgetExample()));
}

class CustomHelloWorldWidgetExample extends StatelessWidget {
  const CustomHelloWorldWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CustomHelloWorldWidget());
  }
}
