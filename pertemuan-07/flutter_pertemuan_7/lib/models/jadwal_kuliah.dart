class JadwalKuliah {
  final String mataKuliah;
  final String hari;
  final String jam;
  final String ruang;
  final String dosen;

  // UUID atau id unik akan lebih baik, tapi kita gunakan constructor yang sama
  JadwalKuliah({
    required this.mataKuliah,
    required this.hari,
    required this.jam,
    required this.ruang,
    required this.dosen,
  });
}