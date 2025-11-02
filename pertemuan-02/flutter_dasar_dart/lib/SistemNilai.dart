import 'dart:io';

class Mahasiswa {
  // inisiasi attrs
  String nama;
  String nim;
  double tugas, uts, uas;

  // inisiasi constructor
  Mahasiswa(this.nama, this.nim, this.tugas, this.uts, this.uas);

  // inisiasi methods
  double hitungNilai() => (tugas * 0.3) + (uts * 0.3) + (uas * 0.4);
  String status() => (hitungNilai() >= 60) ? 'Lulus' : 'Tidak Lulus';
}

// inisiasi class SistemNilai
class SistemNilai {
  // inisiasi list untuk menyimpan object Mahasiswa
  List<Mahasiswa> daftarMahasiswa = [];

  // method untuk menambahkan mahasiswa baru
  void tambahMahasiswa() {
    stdout.write('Masukkan nama mahasiswa: ');
    String nama = stdin.readLineSync()!;
    stdout.write('Masukkan NIM: ');
    String nim = stdin.readLineSync()!;
    stdout.write('Masukkan nilai Tugas: ');
    double tugas = double.parse(stdin.readLineSync()!);
    stdout.write('Masukkan nilai UTS: ');
    double uts = double.parse(stdin.readLineSync()!);
    stdout.write('Masukkan nilai UAS: ');
    double uas = double.parse(stdin.readLineSync()!);

    // buat object baru dari class Mahasiswa
    Mahasiswa mhs = Mahasiswa(nama, nim, tugas, uts, uas);
    daftarMahasiswa.add(mhs);
    print('Mahasiswa berhasil ditambahkan!\n');
  }

  // method untuk menampilkan seluruh daftar nilai
  void tampilkanDaftarNilai() {
    print('\n=== Daftar Nilai Mahasiswa ===');
    for (var mhs in daftarMahasiswa) {
      print(
          '${mhs.nama} (${mhs.nim}) - Nilai Akhir: ${mhs.hitungNilai().toStringAsFixed(2)} (${mhs.status()})');
    }
  }

  // method untuk menghitung rata-rata keseluruhan nilai mahasiswa
  void tampilkanRataRata() {
    if (daftarMahasiswa.isEmpty) {
      print('Belum ada data mahasiswa.');
      return;
    }

    double total = 0;
    for (var mhs in daftarMahasiswa) {
      total += mhs.hitungNilai();
    }

    double rataRata = total / daftarMahasiswa.length;
    print('\nRata-rata nilai seluruh mahasiswa: ${rataRata.toStringAsFixed(2)}');
  }
}

// inisiasi function main
void main() {
  // buat instance dari class SistemNilai
  SistemNilai sistem = SistemNilai();

  stdout.write('Masukkan jumlah mahasiswa: ');
  int jumlah = int.parse(stdin.readLineSync()!);

  // input data mahasiswa sesuai jumlah yang diinputkan user
  for (var i = 0; i < jumlah; i++) {
    print('\nData mahasiswa ke-${i + 1}');
    sistem.tambahMahasiswa();
  }

  // tampilkan seluruh daftar nilai dan rata-rata
  sistem.tampilkanDaftarNilai();
  sistem.tampilkanRataRata();
}