import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          'Latihan Dua Text Widget',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black
          ),
          ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama saya: Muhammad Ridwan',
              style: TextStyle(
                color: Colors.blueAccent,
                fontStyle: FontStyle.italic,
                fontSize: 13
              ),
              ),
              SizedBox(height: 8,),

              // Text Kedua: Alamat
              Text(
                'Alamat: Gotham Jawa Barat',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black
                ),
              )
          ],
        ),
      ),
    )
  ),
);
