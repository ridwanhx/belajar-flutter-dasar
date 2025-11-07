import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 36, horizontal: 16),
        child: Semantics(
          label: 'Pengumuman Penting: Perubahan Jadwal Perkulian dan Lokasi Ujian',
          child: Text(
            'Pengumuman Penting: Perubahan Jadwal Perkuliahan dan Lok...',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 18),
          ),
        ),
        ),
    )
  ),
);
