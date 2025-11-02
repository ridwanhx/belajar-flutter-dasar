import 'dart:io';

// inisiasi function untuk melakukan perhitungan nilai
double hitungNilai(double tugas, double uts, double uas) {
  return (tugas * 0.3) + (uts * 0.3) + (uas * 0.4);
}

// inisiasi function untuk menentukan status kelulusan
String statusLulus(double nilai) {
  return (nilai >= 60) ? 'Lulus' : 'Tidak Lulus';
}

void main() {
  // terima input dari user
  stdout.write('Masukkan jumlah mahasiswa: ');
  int jumlah = int.parse(stdin.readLineSync()!);

  // inisiasi list untuk menyimpan data mahasiswa
  List<String> namaMahasiswa = [];
  List<double> nilaiAkhir = [];
  List<String> statusMahasiswa = [];

  // inisiasi variabel untuk menyimpan rata-rata nilai
  double avgNilai = 0;

  // perulangan untuk input data mahasiswa
  for (var i = 0; i < jumlah; i++) {
    print('\nData mahasiswa ke-${i + 1}');
    stdout.write('Nama mahasiswa: ');
    namaMahasiswa.add(stdin.readLineSync()!);

    // input nilai tugas, uts, uas
    stdout.write('Nilai Tugas: ');
    double tugas = double.parse(stdin.readLineSync()!);
    stdout.write('Nilai UTS: ');
    double uts = double.parse(stdin.readLineSync()!);
    stdout.write('Nilai UAS: ');
    double uas = double.parse(stdin.readLineSync()!);

    // hitung nilai akhir dengan function
    double totalNilai = hitungNilai(tugas, uts, uas);
    nilaiAkhir.add(totalNilai);

    // tentukan status kelulusan
    String status = statusLulus(totalNilai);
    statusMahasiswa.add(status);
  }

  // hitung rata-rata nilai akhir mahasiswa
  for (var i = 0; i < jumlah; i++) {
    avgNilai += nilaiAkhir[i] / jumlah;
  }

  // tampilkan hasil akhir
  print('\n=== Daftar Nilai Mahasiswa ===');
  for (var i = 0; i < jumlah; i++) {
    print('${namaMahasiswa[i]}: ${nilaiAkhir[i].toStringAsFixed(2)} (${statusMahasiswa[i]})');
  }

  print('Rata-rata nilai seluruh mahasiswa: ${avgNilai.toStringAsFixed(2)}');
}
