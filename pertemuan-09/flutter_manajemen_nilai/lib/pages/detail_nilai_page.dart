import 'package:flutter/material.dart';
import '../models/nilai_matakuliah.dart';

class DetailNilaiPage extends StatelessWidget {
  final NilaiMatakuliah data;

  // terima objek NilaiMatakuliah dari halaman sebelumnya
  const DetailNilaiPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        title: Text("Detail ${data.namaMatkul}"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Wrap(
            spacing: 12, // Jarak horizontal antar card
            runSpacing: 12, // Jarak vertikal antar baris
            alignment: WrapAlignment.center,
            children: [
              buildCard("Tugas 1", data.tugas1.toString()),
              buildCard("Tugas 2", data.tugas2.toString()),
              buildCard("Tugas 3", data.tugas3.toString()),
              buildCard("Kuis", data.kuis.toString()),
              buildCard("UTS", data.uts.toString()),
              buildCard("UAS", data.uas.toString()),
              buildCard("Rata-rata", data.rataRata.toStringAsFixed(2)),
              buildCard("Nilai Huruf", data.nilaiHuruf),
              buildCard("Angka Mutu", data.angkaMutu.toString()),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(String judul, String nilai) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.indigo.shade50,
        border: Border.all(color: Colors.indigo),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(judul, style: TextStyle(color: Colors.indigo.shade700)),
          const SizedBox(height: 4),
          Text(
            nilai,
            style: TextStyle(
              color: Colors.indigo.shade700,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
