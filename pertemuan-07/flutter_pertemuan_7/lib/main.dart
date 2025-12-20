import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/auth_controller.dart';
import 'controllers/jadwal_controller.dart';
import 'pages/dashboard_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'utils/local_storage.dart'; // LocalStorage dipindahkan ke sini

void main() {
  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 2. Mendaftarkan Controller dengan MultiProvider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => JadwalController()),
      ],
      child: MaterialApp(
        title: 'Auth & Jadwal Kuliah',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        // Menentukan halaman awal berdasarkan status login
        home: FutureBuilder<bool>(
          future: LocalStorage.isLoggedIn(),
          builder: (context, snap) {
            if (!snap.hasData) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }

            final isLogged = snap.data!;
            if (isLogged) {
              // Jika sudah login, set current user dari LocalStorage
              // dan navigasi ke Dashboard.
              final authController = context.read<AuthController>();
              LocalStorage.getEmail().then((email) {
                if (email != null) {
                  authController.loadUserFromLocal(email);
                }
              });
              return const DashboardPage();
            } else {
              // Jika belum, navigasi ke Register/Login
              return const RegisterPage();
            }
          },
        ),
      ),
    );
  }
}