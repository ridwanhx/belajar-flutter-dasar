import 'package:flutter/foundation.dart';
import '../models/jadwal_kuliah.dart';

class JadwalController extends ChangeNotifier {
  // Data dummy dipindahkan ke sini sebagai initial state
  final List<JadwalKuliah> _jadwalKuliahList = [
    JadwalKuliah(
      mataKuliah: 'Pemograman Mobile',
      hari: 'Senin',
      jam: '08.00 - 09.40',
      ruang: 'Lab RPL 1',
      dosen: 'Bpk. Andi, M.Kom.',
    ),
    JadwalKuliah(
      mataKuliah: 'Basis Data Lanjut',
      hari: 'Senin',
      jam: '10.00 - 11.40',
      ruang: 'Lab Basis Data',
      dosen: 'Ibu Sari, M.T.',
    ),
    JadwalKuliah(
      mataKuliah: 'Jaringan Komputer',
      hari: 'Selasa',
      jam: '13.00 - 14.40',
      ruang: 'Ruang Teori 3',
      dosen: 'Ibu Dina, M.Kom.',
    ),
    JadwalKuliah(
      mataKuliah: 'Kecerdasan Buatan',
      hari: 'Kamis',
      jam: '08.00 - 09.40',
      ruang: 'Lab AI',
      dosen: 'Bpk. Harry, Ph.D.',
    ),
    JadwalKuliah(
      mataKuliah: 'Manajemen Proyek 2',
      hari: 'Jumat',
      jam: '09.00 - 10.40',
      ruang: 'Ruang Teori 1',
      dosen: 'Ibu Maya, M.M.',
    ),
  ];

  // Getter untuk mengakses list jadwal (read-only)
  List<JadwalKuliah> get jadwalKuliahList => _jadwalKuliahList;

  // Method tambah jadwal
  void addJadwal(JadwalKuliah jadwal) {
    _jadwalKuliahList.add(jadwal);
    notifyListeners();
  }

  // Method edit jadwal
  void editJadwal(int index, JadwalKuliah newJadwal) {
    if (index >= 0 && index < _jadwalKuliahList.length) {
      _jadwalKuliahList[index] = newJadwal;
      notifyListeners();
    }
  }

  // Method hapus jadwal
  void removeJadwal(int index) {
    if (index >= 0 && index < _jadwalKuliahList.length) {
      _jadwalKuliahList.removeAt(index);
      notifyListeners();
    }
  }
}
