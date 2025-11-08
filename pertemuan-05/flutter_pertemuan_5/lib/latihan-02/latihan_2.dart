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
            'Contoh Format Teks Produk',
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
                  'Nama Produk: Kopi Arabika Premium 250g',
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
                  'Harga: Rp 45.000',
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
                    'Kode Produk: SKU-ARAB-250G',
                    style: TextStyle(
                      color: Colors.yellow,
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
                  'Stok: 12',
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
                  'Brand/Toko: Roastery Nusantara',
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
