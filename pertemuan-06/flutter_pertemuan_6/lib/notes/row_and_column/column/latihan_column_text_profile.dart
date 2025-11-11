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
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        // atur title agar berada ditengah
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey[200],
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 420
              ),
            child: ProfileCard()
            )
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, .25),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),

      // child: const Placeholder(fallbackHeight: 120,), // kartu putih dengan bayangan
      child: Column(
        // menyesuaikan tinggi kartu agar mengikuti konten, bukan memanjang
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: const CircleAvatar(
              radius: 36,
              backgroundImage: NetworkImage('https://picsum.photos/200'),
            ),
          ),
          SizedBox(height: 12),

          const Text(
            'Alfia April Riani',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          SizedBox(height: 12),

          const Text(
            'Mahasiswa D4 Teknik Informatika',
            style: TextStyle(
              color: Colors.black45,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12),

          Text(
            'Saya adalah mahasiswa yang antusias dalam pengembangan aplikasi mobile dan ingin memperdalam pemograman flutter untuk membuat produk digital yang bermanfaat bagi nusa, bangsa, dan negara.',
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 12),

          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton.icon(
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Tombol hubungi ditekan')),
            ),
            icon: Icon(Icons.email_outlined),
            label: Text(
              'Hubungi Saya',
              style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ),
        ],
      ),
    );
  }
}
