import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(
    home: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 36, horizontal: 16),
        child: SizedBox(
          width: 220,
          child: Text(
            'Ini kalimat panjang yang TIDAK akan dibungkus ke baris berikutnya',
            softWrap: false,
            overflow: TextOverflow.fade,
          ),
        ),
      ),
    ),
  ),
);
