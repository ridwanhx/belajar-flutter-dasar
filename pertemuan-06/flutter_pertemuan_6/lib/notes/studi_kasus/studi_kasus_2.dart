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
        body: SafeArea(child: Center(
          child: WeatherCard()
          )),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 420),
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.cloud, size: 72, color: Colors.blueGrey),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // TODO (1) : Nama kota (besar)
                        Text(
                          'Bandung',
                          style: TextStyle(
                            color: Colors.blueGrey[900],
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4,),

                        // TODO (2) : Suhu (besar, tebal, mis. "28°C")
                        Text(
                          '28\u00B0C',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 4,),

                        // TODO (3) : Kondisi (kecil abu abu, mis. "Berawan")
                        Text(
                          'Berawan',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 8,),

                        Row(
                          children: [
                            Icon(
                              Icons.water_drop,
                              size: 16,
                              color: Colors.blueGrey,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Kelembapan: 75%',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                              ),
                              ),
                          ],
                        ),
                        SizedBox(height: 4),

                        Row(
                          children: [
                            Icon(
                              Icons.air,
                              size: 16,
                              color: Colors.blueGrey,
                            ),
                            SizedBox(width: 4),

                            Text(
                              '12 km/j',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                              ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
