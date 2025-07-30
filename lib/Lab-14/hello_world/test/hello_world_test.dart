import 'package:flutter/material.dart';
import 'package:hello_world/hello_world.dart';

void main() {
  runApp(MaterialApp(home: HelloWorldTest()));
}

class HelloWorldTest extends StatelessWidget {
  const HelloWorldTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CustomHelloWorldWidget());
  }
}
