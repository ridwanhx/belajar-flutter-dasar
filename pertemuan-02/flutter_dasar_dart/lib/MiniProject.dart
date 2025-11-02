import 'dart:io';

// inisiasi class Mahasiswa
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

    Mahasiswa mhs = Mahasiswa(nama, nim, tugas, uts, uas);
    daftarMahasiswa.add(mhs);
    print('\nMahasiswa berhasil ditambahkan!\n');
  }

  // method untuk menampilkan seluruh data mahasiswa
  void tampilkanDataMahasiswa() {
    if (daftarMahasiswa.isEmpty) {
      print('\nBelum ada data mahasiswa.\n');
      return;
    }

    print('\n=== Sistem Nilai Mahasiswa ===');
    for (var mhs in daftarMahasiswa) {
      print('Nama: ${mhs.nama}');
      print('NIM: ${mhs.nim}');
      print('Nilai Akhir: ${mhs.hitungNilai().toStringAsFixed(1)}');
      print('Status: ${mhs.status()}\n');
    }
  }

  // method untuk menghitung rata-rata nilai
  void hitungRataRata() {
    if (daftarMahasiswa.isEmpty) {
      print('\nBelum ada data mahasiswa.\n');
      return;
    }

    double total = 0;
    for (var mhs in daftarMahasiswa) {
      total += mhs.hitungNilai();
    }

    double rataRata = total / daftarMahasiswa.length;
    print('\nRata-rata nilai seluruh mahasiswa: ${rataRata.toStringAsFixed(1)}\n');
  }

  // method untuk mencari mahasiswa berdasarkan NIM
  void cariMahasiswa() {
    if (daftarMahasiswa.isEmpty) {
      print('\nBelum ada data mahasiswa.\n');
      return;
    }

    stdout.write('Masukkan NIM yang ingin dicari: ');
    String cariNim = stdin.readLineSync()!;
    bool ditemukan = false;

    for (var mhs in daftarMahasiswa) {
      if (mhs.nim == cariNim) {
        print('\n=== Sistem Nilai Mahasiswa ===');
        print('Nama: ${mhs.nama}');
        print('NIM: ${mhs.nim}');
        print('Nilai Akhir: ${mhs.hitungNilai().toStringAsFixed(1)}');
        print('Status: ${mhs.status()}\n');
        ditemukan = true;
        break;
      }
    }

    if (!ditemukan) {
      print('\nMahasiswa dengan NIM $cariNim tidak ditemukan.\n');
    }
  }
}

// inisiasi function main
void main() {
  SistemNilai sistem = SistemNilai();
  int pilihan = 0;

  do {
    print('=== MENU UTAMA ===');
    print('1. Tambah Mahasiswa');
    print('2. Tampilkan Data Mahasiswa');
    print('3. Hitung Rata-rata Nilai');
    print('4. Cari Mahasiswa Berdasarkan NIM');
    print('5. Keluar');
    stdout.write('Pilih menu (1-5): ');
    pilihan = int.parse(stdin.readLineSync()!);

    switch (pilihan) {
      case 1:
        sistem.tambahMahasiswa();
        break;
      case 2:
        sistem.tampilkanDataMahasiswa();
        break;
      case 3:
        sistem.hitungRataRata();
        break;
      case 4:
        sistem.cariMahasiswa();
        break;
      case 5:
        print('\nTerima kasih! Program selesai.\n');
        break;
      default:
        print('\nPilihan tidak valid! Silakan coba lagi.\n');
    }
  } while (pilihan != 5);
}
