// # Row dan Column

// Latihan Row Profile

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
        useMaterial3: true, // opsional
      ),
      home: const Scaffold(
        body: SafeArea(child: Center(child: DashboardHeader())),
      ),
    );
  }
}

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo,
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TODO (1) Judul putih tebal, mis. "Welcome back, User"
                Text(
                  'Welcome back, Muhamad Ridwan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),

                // TODO (2) Subjudul putih tipis, mis. "Total Orders: 152"
                Text(
                  'Total Orders: 152',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Montserrat',
                  ),
                ),

                Container(
                  padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                  margin: EdgeInsets.only(top: 6),
                  decoration: BoxDecoration(
                    color: Colors.indigo[100],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '7 Pending Orders',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.indigo[700],
                    ),
                  ),
                ),
              ],
            ),
          ),

          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Tombol notifikasi ditekan.')),
              );
            },
            icon: const Icon(Icons.notifications, color: Colors.white),
            tooltip: 'Notifikasi',
          ),
        ],
      ),
    );
  }
}
