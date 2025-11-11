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
      title: 'Latihan Row Profile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true, // opsional
      ),
      home: const HomeRowPage(),
    );
  }
}

class HomeRowPage extends StatelessWidget {
  const HomeRowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Horizontal'), centerTitle: true),
      body: Container(
        color: Colors.grey.shade200,
        child: const Center(child: RowProfileCardPlaceholder()),
      ),
    );
  }
}

class RowProfileCardPlaceholder extends StatelessWidget {
  const RowProfileCardPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 120,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, .25),
            blurRadius: 8,
            offset: Offset(0, 3),
            ),
        ],
      ),

      // memunculkan kotak sementara
      // child: const Placeholder(), // sementara

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // horizontal
        crossAxisAlignment: CrossAxisAlignment.center,  // vertikal
        children: [
          const CircleAvatar(
            backgroundColor: Colors.teal,
            radius: 28,
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 28,
              ),
          ),
          SizedBox(width: 12,),

          // Kolom Teks (dibungkus Expanded agar fleksibel)
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Alfia April Riani',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black
                  ),
                ),
                SizedBox(height: 4,),

                Text(
                  'Mahasiswa S1 Rekayasa Perangkat Lunak',
                  style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )
              ],
            )
            ),
            SizedBox(width: 4,),

            // Kolom 3: email icon button
            IconButton(
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ikon kirim email ditekan.'))
              ),
              tooltip: 'Kirim email',
              icon: Icon(
                Icons.email_outlined,
                color: Colors.teal,
                )
              )
        ],
      ),
    );
  }
}
