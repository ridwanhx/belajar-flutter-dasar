// # Row dan Column

// Kombinasi dan Nesting (Layout Kompleks)
// Kekuatan sesungguhnya dari tata letak Flutter adalah kemampuan untuk melakukan nesting (penumpukan) widget.
// Sebuah UI yang kompleks pada dasarnya adalah dekomposisi dari Row dan Column yang saling bertumpuk
// Sebagai contoh, sebuah tata letak halaman detail dapat dipecah menjadi:
// (+) Sebuah Column utama untuk menampung seluruh bagian halaman (Gambar, Baris, Judul, Baris Tombol, Teks Deskripsi)
// (+) Di dalam Column tersebut, terdapat Row untuk "Baris Judul"
// (+) Row "Baris Judul" ini kemudian berisi Column (untuk teks judul dan lokasi) dan sebuah Icon (untuk bintang)
// (+) Di bawahnya, terdapat Row lagi untuk "Baris Tombol", yang berisi tiga Column kecil (masing-masing untuk Ikon dan Teks tombol)

// Best Practice / Penanganan Error
// Menghindari Overflow Error
// Jika kita memiliki konteks yang mungkin lebih panjang dari layar (seperti daftar item misalnya), jangan gunakan Column. Gunakan ListView.
// ListView secaara otomatis menyediakan fungsionalitas scrolling
// Jika kita ingin widget child secara fleksibel mengisi ruang yang tersisa, gunakan widget Expanded atau Flexible di dalam Row atau Column.
// Expanded "memaksa" child nya untuk mengambil semua ruang yang tersisa di sepanjang sumbu utama

// Berikan Jarak (Spacing)
// Gunakan MainAxisAlignment (misal .spaceBetween) untuk jarak otomatis dan seragam
// Gunakan SizedBox atau Padding (di dalam Container) untuk jarak manual dan spesifik di antar widget

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan column Teks',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true, // opsional
      ),
      home: Scaffold(
        body: Center(
          child: Container(
            color: Theme.of(context).colorScheme.secondary,
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(color: Colors.red, width: 60, height: 60),
                Container(color: Colors.green, width: 60, height: 100),
                Container(color: Colors.blue, width: 60, height: 60),
                ],
            ),
          ),
        ),
      ),
    );
  }
}
