import 'dart:io';

void main() {
  // inisiasi variabel dan nilai
  double tugas = 80;
  double uts = 75;
  double uas = 85;

  // timpa dengan nilai baru yang di inputkan user
  stdout.write('Masukan nilai tugas: ');
  tugas = double.parse(stdin.readLineSync()!);

  stdout.write('Masukan nilai uts: ');
  uts = double.parse(stdin.readLineSync()!);

  stdout.write('Masukan nilai uas: ');
  uas = double.parse(stdin.readLineSync()!);

  // penentuan nilai akhir
  double nilaiAkhir = (tugas * 0.3) + (uts * 0.3) + (uas * 0.4);

  // penentuan status kelulusan
  // akan menghasilkan true / lulus jika nilai akhir lebih dari atau sama dengan 60
  bool statusKelulusan = nilaiAkhir >= 60;

  // tampilkan output
  print('Nilai Akhir: $nilaiAkhir');
  print('Apakah Lulus?: $statusKelulusan');
}
