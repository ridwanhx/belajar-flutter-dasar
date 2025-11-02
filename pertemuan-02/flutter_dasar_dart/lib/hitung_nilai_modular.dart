// inisiasi function untuk melakukan perhitungan nilai
double hitungNilai(double tugas, double uts, double uas) {
  return (tugas * 0.3) + (uts * 0.3) + (uas * 0.4);
}

// inisiasi function untuk menentukan status kelulusan
String statusLulus(double nilai) {
  return (nilai >= 60) ? 'Lulus' : 'Tidak Lulus';
}

void main() {
  // inisiasi var total untuk menyimpan nilai kembalian function hitungNilai
  double total = hitungNilai(80, 70, 90);
  // tampilkan output
  print('Nilai Akhir: $total');
  print('Status: ${statusLulus(total)}');
}
