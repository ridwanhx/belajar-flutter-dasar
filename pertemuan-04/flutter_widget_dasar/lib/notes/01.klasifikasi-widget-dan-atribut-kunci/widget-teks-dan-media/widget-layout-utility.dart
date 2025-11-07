// # Layout & Utility (Non-Visible)

// Single-child Layout Widgets

// Container
// Merupakan Widget serbaguna yang menggabungkan fungsionalitas painting, positioning, dan sizing.
// "convenience widget" yangdi belakang layar menggunakan widget lain seperti DecoratedBox, Padding, Align, dll..
// Atribut: padding, margin, color, width, height, decoration (biasanya dengan BoxDecoration untuk border, radius, shadow, dan gradient), alignment.

// Padding
// Widget yang tujuannya hanya satu, yaitu memberikan ruang kosong (padding) di sekeliling child nya
// Atribut: padding (menggunakan EdgeInsets.all(), EdgeInsets.symmetric(), atau EdgeInsets.only()).

// Align & Center
// Memposisikan child di dalam ruang yang tersedia.
// Center biasanya untuk kasus yang lebih khusus dari Align dengan alignment: Alignment.center.
// Atribut (Align): alignment (misalnya, Alignment.topLeft, Alignment.bottomRight, atau Alignment(x, y))

// SizedBox
// Sebuah box dengna ukuran yang ditentukan. Sangat berguna untuk dua hal:
// 1. Memaksa child memiliki ukuran tertentu
// 2. Membuat ruang kosong di antara widget lain (dengan tidak memberikan child)
// Atribut: width, height, child

// Expanded & Flexible
// Hanya dapat digunakan sebagai direct child dari Row, Column, atau Flex. Mereka berfungsi untuk memberi tahu parent bagaimana cara membagi ruang yang tersisa di main axis
// Expanded: memaksa child untuk mengisi semua ruang yang tersedia
// Flexible: Memungkinkan child untuk mengisi ruang yang tersedia, tetapi tidak memaksanya.
// FittedBox: Menskalakan dan memposisikan child-nya agar pas di dalam dirinya sendiri. Berguna untuk memastikan teks ataupun gambar agar tidak melebihi batas yang tersedia.

// Multi-child Layout Widgets

// Row & Column
// Merupakan widget layout linear fundamental.
// Row akan menata children nya secara horizontal
// Column akan menata children nya secara vertikal
// Atribut:
// children: List<Widget> yang akan ditata.
// mainAxisAlignment: Mengontrol alignment di sumbu utama (horizontal untuk Row, vertikal untuk Column), nilainya antara lain MainAxisAlignment.start, .center, .end, .spaceBetween, .spaceAround, dan .spaceEvenly.
// crossAxisAlignment: Mengontrol alignment di sumbu silang (vertikal untuk Row, horizontal untuk Column), nilainya antara lain CrossAxisAlignment.start, .center, .end, .stretch.

// Stack
// Memungkinkan widget untuk ditumpuk di atas satu sama lain.
// Widget pertama berada di dalam daftar children paling bawah.
// Atribut:
// children: Daftar widget yang akan ditumpuk
// alignment: Mengontrol alignment default untuk children yang tidak diposisikan

// MaterialApp: Widget root untuk aplikasi Material Design. Mengkonfigurasi banyak aspek tingkat aplikasi seperti theme, home (layar awal), dan routes (navigasi)

// Scaffold: Mengimplementasikan struktur layout visual dasar Material Design. Ini adalah "kerangka" halaman Anda
// Atribut: appBar (AppBar), body (konten utama halaman), floatingActionButton (FloatingActionButton), drawer (BottomNavigationBar). (Drawer), bottomNavigationBar.

// AppBar: Bilah aplikasi di bagian atas layar, biasanya berisi title, actions (ikon di kanan), dan leading (ikon di kiri).

// BottomNavigationBar: Bilah navigasi di bagian bawah layar untuk beralih antar tampilan utama.

// Drawer: Panel navigasi yang meluncur dari samping layar.

// SafeArea: Widget yang sangat penting yang "mendorong" child-nya agar tidak terhalang oleh intrusi sistem seperti notch, status bar, atau area navigasi gestur di bagian bawah layar Praktik Baik: Selalu bungkus konten utama (body) dari Scaffold Anda dengan SafeArea.

import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(
    home: Scaffold(body: Center(child: Text('Halo semua'))),
  ),
);
