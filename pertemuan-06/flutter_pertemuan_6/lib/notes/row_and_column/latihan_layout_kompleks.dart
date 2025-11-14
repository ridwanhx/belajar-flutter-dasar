// # Row dan Column

// Latihan Row Profile

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true, // opsional
      ),
      title: 'Flutter Layout Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contoh 5 - Layout Kompleks'),
        ),

        // gunakan ListView agar nantinya konten bisa di scroll
        body: ListView(
          children: [
            // Gambar Header / Hero
            Image.network(
              'https://picsum.photos/id/29/768/438',
              height: 200,
              fit: BoxFit.cover,
              semanticLabel: 'Hero Image',
            ),

            // (1) BAGIAN JUDUL
            titleSection,

            // (2) BAGIAN TOMBOL
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Builder(
                builder: (context) {
                  final primary = Theme.of(context).colorScheme.primary;
                  return buttonSection(primary);
                },
              ),
            ),

            // (3) BAGIAN TEKS
            textSection,
          ],
        ),
      ),
    );
  }
}

final Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      // a) Kolom teks di kiri, dibungkus Expanded agar mendorong ikon ke kanan
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              // judul
              child: const Text(
                'Parapatan Dago',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),

            // subjudul
            Text(
              'Bandung, Indonesia',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
          ],
        ),
      ),

      // b) Ikon bintang + angka rating di kanan
      const Icon(Icons.star, color: Colors.red),
      const SizedBox(width: 4),
      const Text(
        '4,1',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Colors.black54,
        ),
      ),
    ],
  ),
);

// (2) BAGIAN TOMBOL (Row -> [Column, Column, Column])
Widget buttonSection(Color primary) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildButtonColumn(primary, Icons.call, 'CALL'),
      _buildButtonColumn(primary, Icons.near_me, 'ROUTE'),
      _buildButtonColumn(primary, Icons.share, 'SHARE'),
    ],
  );
}

// Helper membuat satu tombol (ikon+label)
Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      const SizedBox(height: 8),

      Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: color,
          letterSpacing: 0.4,
        ),
      ),
    ],
  );
}

// (3) BAGIAN TEKS
const Widget textSection = Padding(
  padding: EdgeInsets.all(32),
  child: Text(
    'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Deserunt, sint et. Magni.'
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Deleniti?'
    'Lorem ipsum dolor, sit amet consectetur adipisicing.'
    'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis ab consequatur eligendi excepturi.',
    softWrap: true,
    textAlign: TextAlign.justify,
  ),
);
