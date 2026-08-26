import 'package:flutter/material.dart';

class PropertyChild extends StatelessWidget {
  const PropertyChild({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Contoh Button')),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            color: Colors.amber,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text(
                'Button',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}