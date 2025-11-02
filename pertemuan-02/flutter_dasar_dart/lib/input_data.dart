import 'dart:io';

void main() {
  stdout.write('Masukkan nama: ');
  String nama = stdin.readLineSync()!;

  stdout.write('Masukkan NIM: ');
  String nim = stdin.readLineSync()!;

  stdout.write('Masukkan nilai tugas: ');
  double tugas = double.parse(stdin.readLineSync()!);

  stdout.write('Masukkan nilai UTS: ');
  double nilai_uts = double.parse(stdin.readLineSync()!);

  stdout.write('Masukkan nilai UAS: ');
  double nilai_uas = double.parse(stdin.readLineSync()!);

  // Cetak hasil dalam format tabel
  // padRight(20) -> menjaga lebar kolom (padding) agar tetap sejajar
  // toString() -> konversi nilai ke string
  print('\n+----------------+----------------------+');
  print('|     Field      |        Nilai         |');
  print('+----------------+----------------------+');
  print('| Nama           | ${nama.padRight(20)}|');
  print('| NIM            | ${nim.padRight(20)}|');
  print('| Nilai Tugas    | ${tugas.toString().padRight(20)}|');
  print('| Nilai UTS      | ${nilai_uts.toString().padRight(20)}|');
  print('| Nilai UAS      | ${nilai_uas.toString().padRight(20)}|');
  print('+----------------+----------------------+');
}
