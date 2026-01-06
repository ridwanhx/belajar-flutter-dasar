import 'package:flutter/material.dart';
import 'package:flutter_manajemen_nilai/pages/matakuliah_page.dart';
import '../models/semester.dart';

class SemesterPage extends StatefulWidget {
  const SemesterPage({super.key});

  @override
  State<SemesterPage> createState() => _SemesterPageState();
}

class _SemesterPageState extends State<SemesterPage> {
  // inisiasi data awal
  final List<Map<String, dynamic>> semesterData = [
    {"semester": "Semester 1"},
    {"semester": "Semester 2"},
    {"semester": "Semester 3"},
  ];

  late List<Semester> listSemester;

  @override
  void initState() {
    super.initState();
    // konversi Map ke List of Objects
    listSemester = semesterData.map((e) => Semester.fromMap(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Semester"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: listSemester.length,
              padding: const EdgeInsets.only(bottom: 20),
              itemBuilder: (context, index) {
                final item = listSemester[index];

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
                    title: Text(item.semester),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                      color: Colors.grey,
                    ),
                    onTap: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MatakuliahPage(
                        namaSemester: item.semester,
                      )))
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
