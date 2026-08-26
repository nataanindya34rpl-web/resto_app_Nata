import 'package:flutter/material.dart';

class PropertyAlignment extends StatelessWidget {
  const PropertyAlignment({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Contoh Alignment")),
        body: Container(
          alignment: Alignment.bottomCenter,
          child: Text('Semangat Belajar', style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}