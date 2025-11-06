// # Komponen Interaktif (Visible)

// Textfield, Checkbox, Radio, Switch, Slider
// Merupakan komponen komponen yang berfungsi untuk mengumpulkan input atau pilihan dari pengguna.
// Widget-widget ini biasanya digunakan di dalam StatefulWidget karena nilainya berubah berdasarkan interaksi pengguna.

// Atribut Kunci
// -- TextField:
// controller -> Menerima TextEditingController untuk mendapatkan dan memanipulasi teks. Penting: Objek TextEditingController harus dibuat di initState() dan di dispose() untuk mencegah kebocoran memori (memory leak)
// decoration -> Menerima inputDecoration untuk styling, termasuk labelText, hintText, border (OutlineInputBorder), prefixIcon, suffixIcon.
// keyboardType -> Menerima TextInpurType (misalnya, .emailAddress, .number, .phone) untuk menampilkan keyboar yang sesuai pada perangkat mobil, meningkatkan UX
// obscureText -> bool yang digunakan untuk menyembunyikan input, seperti pada field password.

// -- Checkbox, Radio, Switch:
// value -> Nilai saat ini dari kontrol (misalnya, bool untuk Checkbox dan Switch, atau nilai T untuk Radio)
// onChanged -> Callback yang dipanggil saat pengguna mengubah nilai. Di sinilah kita biasanay memanggil setState() untuk memperbarui value dan membangun ulang UI
// groupValue (untuk Radio<T>) -> Nilai yang saat ini dipilih dalam grup radio. Radio akan dianggap terpilih jika value-nya sama dengan groupValue

// -- Slider:
// value -> Nilai double saat ini dari slider
// min, max -> Batas minimum dan maksimum dari rentang nilai.
// onChanged -> Callback yang dipanggil saat pengguna menggeser slider, memberikan nilai baru.

import 'package:flutter/material.dart';

// method main
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Input',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: InputDemo(),
    );
  }
}

// Implementasi
// inisiasi kelas yang extends ke kelas StatefulWidget
class InputDemo extends StatefulWidget {
  @override
  _InputDemoState createState() => _InputDemoState();
}

// inisiasi state dari StatefulWidget untuk menangani perubahan nilai input
class _InputDemoState extends State<InputDemo> {
  // controller untuk menangani input teks dari TextField nama
  final TextEditingController _nameController = TextEditingController();

  // inisiasi controller untuk input teks dari TextField password
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false; // status visibilitas password

  // inisiasi variabel untuk menyimpan status checkbox (true/false)
  bool _isChecked = false;

  // variabel untuk menyimpan pilihan Radio saat ini
  String _selectedGender = 'P';

  // variabel untuk menyimpan status Switch (true/false)
  bool _isSwitched = false;

  // variabel untuk menyimpan nilai Slider (double)
  double _sliderValue = 50;

  // inisiasi map untuk menyimpan status masing-masing hobi
  Map<String, bool> _hobbies = {
    'Coding': false,
    'Streaming': false,
    'Reading': false,
    'Traveling': false,
  };

  // dispose controller untuk mencegah memory leak
  @override
  void dispose() {
    _nameController.dispose();
    // dispose controller (optimalisasi)
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo Input Interaktif')),
      // penambahan padding
      body: Padding(
        // beri jarak untuk semua sisi
        padding: const EdgeInsets.all(16),
        // inisiasi child / konten agar ditampilkan secara vertikal
        child: Column(
          // mengatur posisi children di sumbu silang (kebalikan dari sumbu utama / mainAxisAlignment)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // widget TextField untuk input teks
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nama',
                hintText: 'Masukkan nama Anda',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              keyboardType: TextInputType.name,
            ),
            SizedBox(height: 20),

            TextField(
              controller: _passwordController,
              // khusus untuk password, tambahkan obscure
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Masukkan password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: () => setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  }),
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
            ),

            SizedBox(height: 20),

            // widget CheckboxListTile untuk pilihan setuju / tidak
            CheckboxListTile(
              title: Text(
                'Saya setuju dengan syarat dan ketentuan yang berlaku.',
              ),
              value: _isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value ?? false;
                });
              },
            ),
            SizedBox(height: 10),

            Column(
              children: _hobbies.keys.map((String key) {
                return CheckboxListTile(
                  title: Text(key),
                  value: _hobbies[key],
                  onChanged: (bool? value) {
                    setState(() {
                      _hobbies[key] = value ?? false;
                    });
                  },
                );
              }).toList(),
            ),

            // widget RadioListTile untuk memilih jenis kelamin
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Jenis Kelamin'),
                RadioListTile<String>(
                  title: Text('Laki-laki'),
                  value: 'L',
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: Text('Perempuan'),
                  value: 'P',
                  groupValue: _selectedGender,
                  onChanged: (value) => setState(() {
                    _selectedGender = value!;
                  }),
                ),
              ],
            ),

            // widget Switch untuk mengaktifkan atau menonaktifkan fitur
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Aktifkan notifikasi'),
                Switch(
                  value: _isSwitched,
                  onChanged: (value) => setState(() {
                    _isSwitched = value;
                  }),
                ),
              ],
            ),

            // widget Slider untuk memilih nilai dalam rentang tertentu
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Volume: ${_sliderValue.toInt()}'),
                Slider(
                  value: _sliderValue,
                  min: 0,
                  max: 100,
                  onChanged: (value) => setState(() {
                    _sliderValue = value;
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
