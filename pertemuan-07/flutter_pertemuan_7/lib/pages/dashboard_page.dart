import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/auth_controller.dart';
import '../controllers/jadwal_controller.dart';
import '../models/jadwal_kuliah.dart';
import '../utils/local_storage.dart';
import 'login_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Watch AuthController untuk rebuild jika user berubah (e.g., logout)
    final authController = context.watch<AuthController>();
    // Watch JadwalController untuk rebuild jika list jadwal berubah (tambah/hapus/edit)
    final jadwalController = context.watch<JadwalController>();
    // Read JadwalController untuk method (tanpa rebuild)
    final jadwalWriter = context.read<JadwalController>();
    // Read AuthController untuk method (tanpa rebuild)
    final authWriter = context.read<AuthController>();

    final userName = authController.currentUser?.fullName ?? "Mahasiswa";
    final jadwalList = jadwalController.jadwalKuliahList;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard Jadwal Kuliah"),
        actions: [
          IconButton(
            onPressed: () async {
              authWriter.logout(); // Panggil logout dari controller
              await LocalStorage.clear();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => const LoginPage(), // Navigasi ke LoginPage
                ),
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddJadwalDialog(context, jadwalWriter),
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          _welcomeBanner(userName),
          Expanded(
            child: ListView.builder(
              itemCount: jadwalList.length,
              itemBuilder: (_, i) {
                final j = jadwalList[i];
                return _jadwalTile(
                  context,
                  j,
                  i,
                  jadwalWriter, // passing writer untuk edit/delete
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _welcomeBanner(String name) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    color: Colors.blue.withOpacity(.1),
    child: Text(
      "Selamat datang, $name",
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    ),
  );

  Widget _jadwalTile(
    BuildContext context,
    JadwalKuliah j,
    int i,
    JadwalController controller,
  ) => ListTile(
    title: Text(j.mataKuliah),
    subtitle: Text("${j.hari} • ${j.jam} • ${j.ruang} • ${j.dosen}"),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.edit, color: Colors.blue),
          onPressed: () => _showEditJadwalDialog(context, i, j, controller),
        ),
        IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () => _confirmDelete(context, i, controller),
        ),
      ],
    ),
  );

  // Dialog untuk tambah jadwal
  void _showAddJadwalDialog(BuildContext context, JadwalController controller) {
    _showJadwalFormDialog(context, controller, isEdit: false);
  }

  // Dialog untuk edit jadwal
  void _showEditJadwalDialog(
    BuildContext context,
    int index,
    JadwalKuliah existingJadwal,
    JadwalController controller,
  ) {
    _showJadwalFormDialog(
      context,
      controller,
      isEdit: true,
      index: index,
      existingJadwal: existingJadwal,
    );
  }

  // Konfirmasi hapus jadwal
  void _confirmDelete(
    BuildContext context,
    int index,
    JadwalController controller,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Hapus Jadwal"),
          content: const Text("Yakin ingin menghapus data ini?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Tidak"),
            ),
            ElevatedButton(
              onPressed: () {
                controller.removeJadwal(index); // Hapus data via controller
                Navigator.pop(context);
              },
              child: const Text("Hapus"),
            ),
          ],
        );
      },
    );
  }

  // Form Dialog utama untuk Tambah/Edit
  void _showJadwalFormDialog(
    BuildContext context,
    JadwalController controller, {
    required bool isEdit,
    int? index,
    JadwalKuliah? existingJadwal,
  }) {
    final _formKey = GlobalKey<FormState>();
    final _mkController = TextEditingController(
      text: existingJadwal?.mataKuliah,
    );
    final _jamController = TextEditingController(text: existingJadwal?.jam);
    final _ruangController = TextEditingController(text: existingJadwal?.ruang);
    final _dosenController = TextEditingController(text: existingJadwal?.dosen);
    String? _selectedHari = existingJadwal?.hari;

    final List<String> hariList = [
      'Senin',
      'Selasa',
      'Rabu',
      'Kamis',
      'Jumat',
      'Sabtu',
    ];

    void handleSubmit() {
      if (!_formKey.currentState!.validate()) return;

      final newJadwal = JadwalKuliah(
        mataKuliah: _mkController.text,
        hari: _selectedHari!,
        jam: _jamController.text,
        ruang: _ruangController.text,
        dosen: _dosenController.text,
      );

      if (isEdit) {
        controller.editJadwal(index!, newJadwal); // Update
      } else {
        controller.addJadwal(newJadwal); // Tambah
      }

      Navigator.pop(context); // Tutup dialog
    }

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(isEdit ? "Edit Jadwal" : "Tambah Jadwal"),
              content: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _mkController,
                        decoration: const InputDecoration(
                          labelText: 'Mata Kuliah',
                        ),
                        validator: (v) =>
                            v!.isEmpty ? 'Tidak boleh kosong' : null,
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(labelText: 'Hari'),
                        value: _selectedHari,
                        items: hariList
                            .map(
                              (h) => DropdownMenuItem(value: h, child: Text(h)),
                            )
                            .toList(),
                        onChanged: (value) =>
                            setState(() => _selectedHari = value),
                        validator: (v) => v == null ? 'Pilih Hari' : null,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _jamController,
                        decoration: const InputDecoration(
                          labelText: 'Jam (e.g. 08.00 - 09.40)',
                        ),
                        validator: (v) =>
                            v!.isEmpty ? 'Tidak boleh kosong' : null,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _ruangController,
                        decoration: const InputDecoration(labelText: 'Ruang'),
                        validator: (v) =>
                            v!.isEmpty ? 'Tidak boleh kosong' : null,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _dosenController,
                        decoration: const InputDecoration(labelText: 'Dosen'),
                        validator: (v) =>
                            v!.isEmpty ? 'Tidak boleh kosong' : null,
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Batal"),
                ),
                ElevatedButton(
                  onPressed: handleSubmit,
                  child: Text(isEdit ? "Update" : "Simpan"),
                ),
              ],
            );
          },
        );
      },
    ).then((_) {
      // Clear controllers setelah dialog ditutup
      _mkController.dispose();
      _jamController.dispose();
      _ruangController.dispose();
      _dosenController.dispose();
    });
  }
}
