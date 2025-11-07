import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(
    home: Scaffold(
      body: Center(
        child: Text(
          'Halo semua',
          style: TextStyle(
            fontSize: 22,
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.wavy,
            decorationColor: Colors.indigo
          ),
        ),
      )
    ),
  ),
);
