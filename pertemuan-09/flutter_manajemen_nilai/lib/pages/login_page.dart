import 'package:flutter/material.dart';
import 'package:flutter_manajemen_nilai/main.dart';
import 'package:flutter_manajemen_nilai/pages/semester_page.dart';
import '../models/user.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Data awal dalam bentuk JSON
  final List<Map<String, dynamic>> userData = [
    {"username": "admin", "password": "admin@123"},
    {"username": "ridwan", "password": "ridwan@123"},
    {"username": "test", "password": "test@123"},
  ];

  late List<User> listUser;

  void initState() {
    super.initState();
    listUser = userData.map((e) => User.fromMap(e)).toList();
  }

  // inisiasi controller u/ menangkap input
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // logic login
  void _login() {
    // ambil setiap nilai input
    String username = _usernameController.text;
    String password = _passwordController.text;

    // validasi 1: Cek apakah input kosong
    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Username dan password tidak boleh kosong!"),
        ),
      );
      return;
    }

    // penetapan user valid
    bool isUserValid = listUser.any(
      (user) => user.username == username && user.password == password,
    );

    // cek apakah username dan password sesuai
    if (isUserValid) {
      // jika berhasil
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Selamat datang, $username!",
            style: TextStyle(color: Colors.green.shade800),
          ),
          backgroundColor: Colors.green.shade200,
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SemesterPage()),
      );
    } else {
      // jika gagal
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Username / Password salah!"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 8),

            const Text(
              "Silahkan login terlebih dahulu",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 32),

            // Textfield Username
            TextField(
              controller: _usernameController,
              autofocus: true,
              decoration: InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                prefixIcon: const Icon(Icons.person),
                prefixIconColor: Colors.indigo,
              ),
            ),
            const SizedBox(height: 20),

            // Textfield Password
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                prefixIcon: const Icon(Icons.lock),
                prefixIconColor: Colors.indigo,
              ),
            ),
            const SizedBox(height: 30),

            // button sign in
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _login,
                child: const Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
