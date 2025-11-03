// # Icon, Image.asset, Image.network

// Fungsi:
// Icon -> Menampilkan glyph dari font icon, biasanya dari set Icons Material atau Cupertinolcons.
// Image.asset -> Menampilkan gambar dari folder assets proyek kita. Membutuhkan konfigurasi di pubspec.yaml
// Image.network -> Menampilkan gambar dari URL

// Atribut Kunci:
// size & color (untuk Icon) -> Mengontrol ukuran dan warna icon
// width & height (untuk Image) -> Memberikan batasan ukuran eksplisit pada gambar
// fit (untuk Image) -> Mengontrol bagaimana gambar diskalakan untuk mengisi ruang yang dialokasikan (BoxFit.cover, BoxFit.contain, BoxFit.fill, dll)
// errorBuilder (untuk Image.network) -> Callback yang dipanggil jika terjadi kesalahan saat memuat gambar (misal 404 Not Found, dll), memungkinkan kita untuk menampilkan widget placeholder (misal, icon error atau gambar default)
// semanticLabel (untuk Icon dan Image) -> Mendeskripsikan ikon atau gambar untuk screen reader

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.favorite,
                size: 48,
                color: Colors.teal,
                semanticLabel: 'Icon favorite berwarna teal',
              ),

              const SizedBox(height: 20),
              // image dari assets
              Image.asset(
                'assets/images/logo.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                semanticLabel: 'image from local asset',
              ),

              const SizedBox(height: 20),
              // Image dari internet
              Image.network(
                'https://picsum.photos/200',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                semanticLabel: 'Image from internet',
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.error,
                    size: 48,
                    color: Colors.grey,
                    semanticLabel: 'Jika image tidak tampil',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
