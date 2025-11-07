import 'package:flutter/material.dart';

void main() => runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 18),
              children: <TextSpan>[
                TextSpan(
                  text: 'Belajar ',
                ),
                TextSpan(
                  text: 'Flutter',
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold
                    ),
                ),
                TextSpan(text: ' itu menyenangkan.')
              ],
            ),
          ),
        ),
      ),
    )
);
