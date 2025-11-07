// # Komponen Interaktif (Visible)

// Form dasar
// Form, GlobalKey, TextFormField, pola validasi
// Mengelompokkan, memvalidasi, dan menyimpan beberapa field input secara bersamaan.
// Atribut Kunci & Pola:
// 1. GlobalKey<FormState> -> Buat sebuah global key sebagai "pegangan" untuk Form yang kita buat.
// cth: final _formkey = GlobalKey<FormState>();

// 2. Form Widget -> Bungkus semua field input dengan widget Form dan berikan key yang telah dibuat.
// cth: Form(key: _formKey, child: ...)

// 3. TextFormField -> Gunakan TextFormField alih-alih TextField. Ini adalah TextField yang sudah terintegrasi dengan Form.

// 4. validator -> Atribut terpenting pada TextFormField. Ini adalah fungsi yang menerima String (input pengguna) dan harus mengembalikan String (pesan error) jika input tidak valid, atau null jika valid.

// 5. Validasi -> Panggil _formKey.currentState!.validate(), (biasanya di dalam onPressed sebuah tombol). Metode ini akan menjalankan fungsi validator untuk setiap TextFormField di dalam Form. Jika semua validator mengembalikan null, metode ini mengembalikan true. Jika ada yang mengembalikan pesan error, ia akan mengembalikan false dan menampilkan pesan error tersebut di UI.

// 6. autoValidateMode -> Mengontrol kapan validasi otomatis terjadi. AutovalidateMode.disabled (sebagai default) berarti validasi hanya terjadi saat .validate() dipanggil.
// AutovalidateMode.onUserInteraction adalah praktik UX yang baik, di mana validasi pada sebuah field akan aktif setelah pengguna berinteraksi dengannya untuk pertama kali.

import 'package:flutter/material.dart';

// method main
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Form',
      home: Scaffold(
        appBar: AppBar(title: Text('Form validasi')),
        // panggil kelas MyForm untuk di render ke layar
        body: MyForm(),
      ),
    );
  }
}

// inisiasi kelas yang extends StatefulWidget
class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                hintText: 'Masukkan username',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              keyboardType: TextInputType.text,
              validator: (value) {
                return (value == null || value.isEmpty)
                    ? 'Field nama tidak boleh kosong'
                    : null;
              },
            ),
            SizedBox(height: 20),

            TextFormField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              validator: (value) {
                return (value == null || value.isEmpty)
                    ? 'Field password tidak boleh kosong.'
                    : null;
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Masukkan password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
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
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Form valid!')));
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(8),
                ),
              ),
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
