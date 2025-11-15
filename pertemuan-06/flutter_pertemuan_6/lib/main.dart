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
        body: SafeArea(child: Center(child: ProfileCard())),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

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
              color: Color.fromRGBO(3, 3, 3, .25),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // TODO (1) Ikon profil besar
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 48,
                backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/93636329?v=4',
                ),
              ),
            ),
            SizedBox(height: 12),

            // TODO (2) Nama (tebal) + deskripsi singkat (abu-abu)
            Align(
              alignment: Alignment.center,
              child: Text(
                'Muhamad Ridwan',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 12),

            Align(
              alignment: Alignment.center,
              child: Text(
                textAlign: TextAlign.center,
                '"Mana 19 Juta Lapangan Kerja yang kamu janjikan itu wok."',
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 20),

            // TODO (3) Row Statistik (Posts, Followers, Following)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        '31',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.black
                        ),
                      ),

                      Text(
                        'posts',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18
                        ),
                      )
                    ],
                  ),
                  ),

                Expanded(
                  child: Column(
                    children: [
                      Text(
                        '112',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.black
                        ),
                      ),

                      Text(
                        'followers',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18
                        ),
                      )
                    ],
                  ),
                  ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        '178',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.black
                        ),
                      ),

                      Text(
                        'following',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18
                        ),
                      )
                    ],
                  ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}