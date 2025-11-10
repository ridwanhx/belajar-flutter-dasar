// # Row dan Column
// Perbedaan paling mendasar antara Row dan Column terletak pada arah sumbu utama (Main Axis)

// Row (Baris)
// Menyusun widget child nya secara horizontal (dari kiri ke kanan).
// Sumbu utama (Main Axis) adalah Horizontal
// Sumbu Silang (Cross Axis) adalah Vertikal

// Column (Kolom)
// Menyusun widget child nya secara vertikal (dari atas ke bawah)
// Sumbu utama (Main Axis) adalah Vertikal
// Sumbu Silang (Cross Axis) adalah Horizontal

// Fungsi MainAxisAlignment dan CrossAxisAlignment
// + MainAxisAlignment (Perataan Sumbu Utama)
// Properti ini mentnukan bagaimana widget child harus ditempatkan di sepanjang sumbu utama (horizontal untuk Row, vertikal untuk Column)
// .start -> Menempatkan child-child nya sedekat mungkin dengan awal sumbu (kiri untuk Row, atas untuk Column), yang dimana ini juga merupakan nilai default nya.
// .center -> Menempatkan child-child nya di tengah sumbu.
// .end -> Menempatkan child-child nya di akhir sumbu (kanan untuk Row, bawah untuk Column).

// + CrossAxisAlignment (Perataan Sumbu Silang)
// Properti ini menentukan bagaimana widget child harus ditempatkan di sepanjang sumbu silang (vertikal untuk Row, horizontal untuk Column)
// .start -> Menempatkkan child-child nya di awal sumbu silang (atas untuk Row, kiri untuk Column)
// .center -> Menempatkan child-child nya di tengah sumbu silang. Merupakan nilai default untuk Row dan Column
// .end -> Menempatkan child-child nya di akhir sumbu silang (bawah untuk Row, kanan untuk Column)
// .stretch -> Memaksa child-child nya untuk mengisi seluruh ruang yang tersedia di sepanjang sumbu silang


// Variasi Nilai Alignment (Distribusi Ruang)
// Perbedaan utama dalam MainAxisAlignment adalah pada nilai-nilai yang mendistribusikan ruang kosong
// MainAxisAlignment.spaceBeetween -> Ruang kosong ditempatkan secara merata hanya diantara childs. Tidak ada ruang awal atau akhir
// MainAxisAlignment.spaceAround -> Ruang kosong ditempatkan secara merata di antara anak-anak, dan setengah dari ruang tersebut ditempatkan di awal dan akhir
// MainAxisAlignment.spaceEvenly -> Ruang kosong didistribusikan secara merata diantara setiap child, termasuk di awal dan akhir.

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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true, // opsional
      ),
      home: Scaffold(
        body: Center(
          child: Row(
            // implementasi .spaceBetween
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,

            // implementasi .spaceAround
            // mainAxisAlignment: MainAxisAlignment.spaceAround,

            // implementasi .spaceAround
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Theme.of(context).colorScheme.primary,
                width: 80,
                height: 80,
              ),
              Container(
                color: Theme.of(context).colorScheme.secondary,
                width: 80,
                height: 80,
              ),
              Container(color: Colors.amber, width: 80, height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
