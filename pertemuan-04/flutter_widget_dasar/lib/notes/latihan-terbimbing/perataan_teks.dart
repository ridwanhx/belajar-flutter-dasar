import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(
    home: Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Paragraf ini diratakan ke tengah agar mudah diamati.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Sudah tahu hanya sepihak rindu masih coba lempar dadu peruntunganku.',
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Gegabah nomor satu paling paling menangis seperti dulu.',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Lagu lama yang aku tahu uh-uh-uh-uh, lupa buta atau ku batu.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    ),
  ),
);
