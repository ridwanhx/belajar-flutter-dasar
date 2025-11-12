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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true, // opsional
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contoh 4 - Row Counter'),
          centerTitle: true,
        ),
        body: const Center(child: CounterWidget()),
      ),
    );
  }
}

// Implementasi Stateful
// Inisiasi StatefulWidget karena nilai counter akan berubah ubah
class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  // inisiasi nilai awal attr
  int _counter = 0;

  // method untuk melakukan increment
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // method untuk melakukan decrement
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Tombol Minus
        IconButton(
          onPressed: _decrementCounter,
          icon: const Icon(Icons.remove_circle, color: Colors.red, size: 36),
          tooltip: 'Kurangi nilai',
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            '$_counter',
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),

        IconButton(
          onPressed: _incrementCounter,
          icon: const Icon(Icons.add_circle, color: Colors.green, size: 36),
          tooltip: 'Tambah nilai',
        ),
      ],
    );
  }
}
