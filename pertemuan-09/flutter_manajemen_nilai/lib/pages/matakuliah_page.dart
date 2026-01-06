import 'package:flutter/material.dart';
import 'package:flutter_manajemen_nilai/pages/detail_nilai_page.dart';
import '../models/nilai_matakuliah.dart';

class MatakuliahPage extends StatelessWidget {
  final String namaSemester;

  // tangkap data semester dari halaman sebelumnya
  const MatakuliahPage({super.key, required this.namaSemester});

  @override
  Widget build(BuildContext context) {
    // dummy data matkul berdasarkan semester yang dipilih
    final Map<String, List<NilaiMatakuliah>> dataMatkul = {
      "Semester 1": [
        NilaiMatakuliah(
          namaMatkul: "Algoritma Pemograman",
          tugas1: 80,
          tugas2: 90,
          tugas3: 89,
          kuis: 82,
          uts: 76,
          uas: 90,
        ),
        NilaiMatakuliah(
          namaMatkul: "Pendidikan Pancasila",
          tugas1: 60,
          tugas2: 80,
          tugas3: 79,
          kuis: 82,
          uts: 76,
          uas: 90,
        ),
        NilaiMatakuliah(
          namaMatkul: "Basis Data",
          tugas1: 70,
          tugas2: 70,
          tugas3: 79,
          kuis: 62,
          uts: 76,
          uas: 88,
        ),
      ],
      "Semester 2": [
        NilaiMatakuliah(
          namaMatkul: "Matematika Diskrit",
          tugas1: 80,
          tugas2: 80,
          tugas3: 84,
          kuis: 81,
          uts: 76,
          uas: 70,
        ),
        NilaiMatakuliah(
          namaMatkul: "Metodologi Penelitian",
          tugas1: 85,
          tugas2: 85,
          tugas3: 81,
          kuis: 81,
          uts: 70,
          uas: 70,
        ),
      ],
      "Semester 3": [
        NilaiMatakuliah(
          namaMatkul: "Pemograman IV",
          tugas1: 95,
          tugas2: 77,
          tugas3: 89,
          kuis: 80,
          uts: 79,
          uas: 91,
        ),
        NilaiMatakuliah(
          namaMatkul: "Machine Learning",
          tugas1: 75,
          tugas2: 77,
          tugas3: 69,
          kuis: 89,
          uts: 73,
          uas: 97,
        ),
      ],
    };

    final listMatkul = dataMatkul[namaSemester] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text("Mata Kuliah $namaSemester"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: listMatkul.isEmpty
          ? const Center(child: Text("Belum ada data mata kuliah"))
          : ListView.builder(
              itemCount: listMatkul.length,
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemBuilder: (context, index) {
                final matkul = listMatkul[index];
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Colors.indigo.shade100),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(matkul.namaMatkul),
                    subtitle: Text(
                      "Rata-rata: ${matkul.rataRata.toStringAsFixed(1)}",
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailNilaiPage(data: matkul,),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
