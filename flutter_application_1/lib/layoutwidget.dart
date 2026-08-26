import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Contoh Button"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade900,
              foregroundColor: Colors.white,
            ),
            child: const Text(
              "Button",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}