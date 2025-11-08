import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Text(
            'Detail Pengiriman Logistik',
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Nomor Resi
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Nomor Resi: INV-LOG-2025-1108-XYZ',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // 2. Kurir
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Kurir: Nusantara Express',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // 3. Layanan
              Align(
                alignment: Alignment.center,
                child: Container(
                  color: Colors.green,
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Layanan Reguler: (24 hari)',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // 4. Status
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Status: Dalam Pengantaran (Transit Bandung Hub)',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // 5. Tanggal Pickup
              Container(
                color: Colors.grey[300],
                padding: const EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Tanggal Pickup: Sabtu, 08 Nov 2025 \u2022 09:15',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // 6. ETA
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Perkiraan Tiba: Senin, 10 Nov 2025 \u2022 14:00-18:00 WIB',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // 7. Pengirim
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pengirim: CV Sinar Jaya',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // 8. Alamat Asal
              Container(
                color: Colors.blue[100],
                padding: const EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Alamat Asal: Jl. Merdeka No. 10, Kec. Coblong, Kota Bandung, Jawa Barat 40132',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // 9. Penerima
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Penerima: Bapak Dwi Saputra',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // 10. Alamat Tujuan
              Container(
                color: Colors.green[100],
                padding: const EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Alamat Tujuan: Jl. Kenari Indah Blok C3 No. 7, Kel. Jatibening, Bekasi, Jawa Barat 17412',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // 11. Berat
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Berat: 3.60 kg',
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue[900],
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // 12. Dimensi
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Dimensi: 30 x 25 x 20 cm',
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // 13. Biaya
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Biaya: Rp 42.000',
                  style: TextStyle(
                    color: Colors.green[400],
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // 14. Instruksi Khusus
              Container(
                color: Colors.yellow[200],
                padding: const EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Instruksi Khusus: Mohon hubungi penerima 10 menit sebelum tiba. Paket mudah pecah.',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // 15. Catatan Internal
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Catatan Internal: Rute kurir dialihkan sementara (perbaikan jalan), potensi keterlambatan \u00B130 menit',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 14,
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