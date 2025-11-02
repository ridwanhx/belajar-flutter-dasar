import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Root widget
      home: Scaffold(
        appBar: AppBar(title: Text('My Title')),
        body: Center(
          child: Text("Hello, World!", style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(65, 105, 225, .8)
          ),),
        ),
      ),
    );
  }
}
