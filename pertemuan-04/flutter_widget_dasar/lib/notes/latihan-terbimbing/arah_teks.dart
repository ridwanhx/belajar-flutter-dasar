import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 36, horizontal: 16),
          child: Text(
            ' اًبحرم مكب يف Flutter',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 22),
          ),
        ),
      ),
    ),
  ),
);
