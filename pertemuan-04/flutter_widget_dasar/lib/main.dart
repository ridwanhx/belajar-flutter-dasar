// # Komponen Interaktif (Visible)

// ElevatedButton, TextButton, dan IconButton
// Secara fungsi, komponen-komponen ini akan memicu aksi saat pengguna berinteraksi (menekan). Flutter telah beralih dari RaisedButton, FlatButton ke ElevatedButton, TextButton, dll.
// Menawarkan sistem styling yang lebih konsisten dan fleksibel.
// Beberapa atribut kunci terkait :
// 1. onPressed: Callback VoidCallback yang dieksekusi saat tombol ditekan. (jika bernilai null, secara otomatis tombol akan masuk ke disabled state / tampilan non-aktif dan tidak bisa ditekan)
// 2. child (untuk ElecatedButton, TextButton): Widget yang ditampilkan di dalam tombol, biasanya Text.
// 3. icon (untuk IconButton dan varian .icon): Widget Icon yang ditampilkan.
// 4. style: Menerima objek ButtonStyle. Cara modern untuk mengkostumisasi tampilan tombol. Gunakan metode statis seperti ElevatedButton.styleFrom() untuk kemudahan, yang memungkinkan kita untuk misal mengatur backgroundColor, foregroundColor (warna, teks/icon), shape, padding, dan lainnya.

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Membuat button menggunakan ElevatedButton
              // secara default menerima dua parameter: onPressed, dan child
              ElevatedButton(
                // aksi yang akan dilakukan ketika tombol di tekan / on press
                onPressed: () {
                  print('ElevatedButton ditekan.');
                },
                style: ElevatedButton.styleFrom(
                  // menambahkan warna background untuk button
                  backgroundColor: Colors.red,
                  // menambahkan warna teks button
                  foregroundColor: Colors.white,
                  // menambahkan padding
                  // vertical, kalau di css ini sama seperti padding-y
                  // horizontal, kalau di css ini sama seperti padding-x
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  // mengatur radius
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(8),
                  ),
                ),
                // Konten berupa text bertuliskan Elevated
                child: Text('Elevated'),
              ),

              // Membuat button menggunakan TextButton
              TextButton(
                onPressed: () {
                  print('TextButton ditekan.');
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  // EdgeInsets.all, kalau di css ini sama seperti menambahkan padding untuk semua sisi nya dengan jumlah yang sama
                  padding: EdgeInsets.all(16),
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Times New Roman',
                  ),
                ),
                child: Text('TextButton'),
              ),

              // Membuat button menggunakan IconButton
              // secara default menerima dua parameter, yaitu onPressed dan icon
              // menambahkan juga tooltip
              IconButton(
                onPressed: () {
                  print('IconButton ditekan.');
                },
                icon: Icon(Icons.thumb_up),
                color: Colors.indigoAccent,
                iconSize: 32,
                tooltip: 'Sukai',
              ),

              // Membuat tombol disabled
              // kombinasi icon dan text, direpresentasikan melalui icon dan label
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                ),
                icon: Icon(Icons.send),
                label: Text('Send'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
