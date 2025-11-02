import 'dart:io';

void main() {
  // inisiasi nilai berdasarkan input yang dikirimkan user
  stdout.write('Masukkan nilai akhir: ');
  double nilai = double.parse(stdin.readLineSync()!);

  // penentuan predikat berdasarkan kriteria nilai tertentu
  if (nilai >= 80) {
    print('Predikat: A (Lulus dengan pujian)');
  } else if (nilai >= 60) {
    print('Predikat: B (Lulus)');
  } else {
    print('Predikat: C (Tidak Lulus)');
  }

  // logika motivasi
  if (nilai >= 80) {
    print('Kerja bagus atas pencapaianmu. tetap pertahankan!');
  } else if (nilai >= 60) {
    print('Kemenangan yang tertunda, kita coba lebih baik kedepannya.');
  } else {
    print(
      'Semangat belajarmu perlu ditingkatkan, coba lagi dan jangan menyerah.',
    );
  }
}
