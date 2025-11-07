import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Text(
          'Yowww Barudak',
          style: TextStyle(
            fontSize: 48,
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.black54,
                blurRadius: 6,
                offset: Offset(2, 3),
              ),
            ],
          ),
        ),
      ),
    ),
  ),
);
