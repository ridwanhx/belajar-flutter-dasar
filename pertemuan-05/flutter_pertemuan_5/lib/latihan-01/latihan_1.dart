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
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text(
            'Contoh Format Teks di Flutter',
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Nama: Muhamad Ridwan',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Colors.blue[400],
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),

              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Alamat: Jl. Sariasih No. 54, Sarijadi, Kec. Sukasari, Kota Bandung, Jawa Barat',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              SizedBox(height: 20),

              Align(
                alignment: Alignment.center,
                child: Container(
                  color: Colors.green,
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Email: ridwan@ulbi.ac.id',
                    style: TextStyle(
                      color: Colors.blue[900],
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Program Studi: D4 Teknik Informatika',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue[400],
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue[400],
                  ),
                ),
              ),
              SizedBox(height: 20),

              Container(
                color: Colors.grey[300],
                padding: EdgeInsets.all(8),
                child: Text(
                  'Kampus: Universitas Logistik dan Bisnis Internasional (ULBI)',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
