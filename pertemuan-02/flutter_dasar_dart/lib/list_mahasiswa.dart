import 'dart:io';

void main() {
  // terima input dari user
  stdout.write('Masukkan jumlah mahasiswa: ');
  int jumlah = int.parse(stdin.readLineSync()!);

  // inisiasi list dengan tipe data string
  List<String> namaMahasiswa = [];
  // inisiasi list dengan tipe data double
  List<double> nilaiAkhir = [];
  // inisiasi variabel untuk menyimpan rata-rata nilai mhs
  double avgNilai = 0;

  // inisiasi perulangan sebanyak jumlah mahasiswa yang diinputkan user
  for (var i = 0; i < jumlah; i++) {
    stdout.write('Nama mahasiswa ke-${i + 1}: ');
    // tambahkan nilai kedalam list namaMahasiswa
    namaMahasiswa.add(stdin.readLineSync()!);

    // tampilkan output
    stdout.write('Nilai akhir: ');
    nilaiAkhir.add(double.parse(stdin.readLineSync()!));
  }

  // fitur rata-rata nilai mahasiswa
  for (var i = 0; i < jumlah; i++) {
    avgNilai += nilaiAkhir[i] / jumlah;
  }

  print('\n=== Daftar Nilai ===');
  for (var i = 0; i < jumlah; i++) {
    // tampilkan nama mahasiswa beserta nilai akhirnya
    print('${namaMahasiswa[i]}: ${nilaiAkhir[i]}');
  }

  // tampilkan rataan nilai seluruh mahasiswa
  print('Rata-rata nilai seluruh mahasiswa: ${avgNilai.truncateToDouble()}');
}
