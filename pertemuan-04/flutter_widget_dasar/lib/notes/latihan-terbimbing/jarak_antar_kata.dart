import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(
    home: Scaffold(
      body: Center(
        child: Text(
          'Halo semua mahasiswa',
          style: TextStyle(color: Colors.indigo, fontSize: 22, wordSpacing: 8),
        ),
      ),
    ),
  ),
);
