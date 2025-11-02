import 'package:flutter/material.dart';

void main() => runApp(
  Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Halo Semuanya, Apa Kabarnya?",
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 32,
              fontFamily: 'Montserrat',
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Saya adalah Ridwan",
          style: TextStyle(
            color: Colors.purple,
            fontSize: 16,
            fontFamily: 'Montserrat',
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Text(
          "Hobi saya jalan-jalan",
          style: TextStyle(
            color: Colors.yellow,
            fontSize: 32,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  ),
);
