class NilaiMatakuliah {
  final String namaMatkul;
  final double tugas1;
  final double tugas2;
  final double tugas3;
  final double kuis;
  final double uts;
  final double uas;

  NilaiMatakuliah({
    required this.namaMatkul,
    required this.tugas1,
    required this.tugas2,
    required this.tugas3,
    required this.kuis,
    required this.uts,
    required this.uas,
  });

  double get rataRata => (tugas1 + tugas2 + tugas3 + kuis + uts + uas) / 6;

  String get nilaiHuruf {
    if (rataRata >= 85) return "A";
    if (rataRata >= 75) return "B";
    if (rataRata >= 65) return "C";
    if (rataRata >= 50) return "D";
    return "E";
  }

  double get angkaMutu {
    switch (nilaiHuruf) {
      case "A":
        return 4.0;
      case "B":
        return 3.0;
      case "C":
        return 2.0;
      case "D":
        return 1.0;
      case "E":
      default:
        return 0.0;
    }
  }
}
