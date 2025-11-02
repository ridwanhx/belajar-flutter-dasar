// import 'package:flutter/material.dart';
import 'dart:io';

class Mahasiswa {
  String nama = '';
  int umur = 0;

  Mahasiswa(this.nama, this.umur);

  void perkenalan() {
    print('Halo, nama saya $nama, umur saya $umur tahun.');
  }

  void belajar() {
    print('$nama sedang belajar');
  }

  void tidur() {
    print('$nama sedang tidur');
  }
}

main() {
  var a = 10;
  var b = 3;
  print(a ~/ b);

  print('==============');
  for (var i = 1; i <= 5; i++) {
    for (var j = 1; j <= i; j++) {
      stdout.write("*");
    }
    stdout.writeln();
  }

  print('==============');

  var mhs = Mahasiswa('Marlina', 21);
  mhs.belajar();
  mhs.tidur();
  mhs.perkenalan();

  print('==============');
  var nama = 'Voyager I'; // Tipe diinferensikan sebagai String
  var tahun = 1977; // Tipe diinferensikan sebagai int
  nama = 'Voyager II'; // OK: nilai dapat diubah

  print('Mobil $nama merupakan keluaran tahun $tahun');
}
