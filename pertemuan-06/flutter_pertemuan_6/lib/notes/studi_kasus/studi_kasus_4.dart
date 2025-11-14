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
        body: SafeArea(child: Center(child: ContactList())),
      ),
    );
  }
}

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  Widget build(BuildContext context) {
    Widget contactRow(String name, String phone) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            const CircleAvatar(radius: 24, child: Icon(Icons.person)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TODO (1): name tebal
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),

                  // TODO (2): phone abu-abu
                  Text(
                    phone,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Tombol telepon ditekan.')),
                );
              },
              icon: Icon(Icons.call, color: Colors.black, size: 20),
            ),
          ],
        ),
      );
    }

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 540),
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(12),
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
        child: Column(
          children: [
            contactRow('Mela Yustita Fitri', '0812-2345-7890'),
            const Divider(height: 1),
            contactRow('Alfia April Riani', '0851-2311-7990'),
            const Divider(height: 1),
            contactRow('Hana Meysha Berliana', '0887-2310-7920'),
          ],
        ),
      ),
    );
  }
}
