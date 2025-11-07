import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(
    home: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 36, horizontal: 16),
        child: Text(
          'Judul ini sangat panjang untuk melihat bagaimana pemotongannya terjadi bila hanya satu baris saja yang diizinkan.',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 18),
        ),
      ),
    ),
  ),
);
