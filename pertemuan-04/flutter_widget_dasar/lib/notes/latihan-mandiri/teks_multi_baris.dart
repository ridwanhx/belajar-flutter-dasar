import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          'Latihan Teks Multi-Baris',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama saya: Muhammad Ridwan',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.blue,
                fontSize: 13,
              ),
            ),
            SizedBox(height: 8),

            Text(
              'Alamat : Kabupaten Gotham',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 12),

            Text(
              'Hobi saya adalah:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 4),

            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('\u2022 Ngoding'),
                  Text('\u2022 Nonton Orang Ngoding'),
                  Text('\u2022 Bercoding'),
                ],
              ),
            ),
            SizedBox(height: 12),

            Text(
              'Bahasa pemograman yang dikuasai:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
            ),
            SizedBox(height: 4,),

            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('1. PHP'),
                  Text('2. Javascript'),
                  Text('3. Go'),
                ],
              ),
              )
          ],
        ),
      ),
    ),
  ),
);
