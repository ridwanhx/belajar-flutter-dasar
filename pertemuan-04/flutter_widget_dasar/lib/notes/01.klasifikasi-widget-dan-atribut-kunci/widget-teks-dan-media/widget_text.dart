// # Widget Teks dan Media
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Root widget
      home: Scaffold(
        appBar: AppBar(title: Text('My Title')),
        body: Center(
          // Text
          // Menampilkan sebaris atau beberapa baris teks dengan gaya tunggal
          // pada kasus ini digunakan beberapa atribut kunci seperti textAlign, maxLines, overflow, dan style
          child: Text("Ini adalah contoh kalimat yang sangat panjang, dan mungkin panjangnya lebih dari satu baris dan jika lebih banyak lagi akhir kalimatnya akan diganti dengan ...", 
          textAlign: TextAlign.center,  // Mengatur perataan teks secara horizontal
          maxLines: 2,  // Menentukan jumlah maksimum baris yang diizinkan untuk teks
          overflow: TextOverflow.ellipsis,  // Menentukan bagaimana menangani teks yang melebihi dimensi yang tersedia
          // Digunakan ellipsis untuk menampilkan "..." di akhir kalimat / teks

          // Mengontrol properti visual seperti fontSize, fontWeight, dll..
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(65, 105, 225, .8)
          ),),
        ),
      ),
    );
  }
}
