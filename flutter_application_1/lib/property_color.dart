import 'package:flutter/material.dart';

class ColorApp extends StatelessWidget {
  const ColorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Contoh Color")),
        body: Container(
          margin: EdgeInsets.all(50),
          height: 200,
          width: 200,
          alignment: Alignment.center,
          color: Colors.amber[900],
          child: Text(
            'Semangat Belajar',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ))),
    );
  }
}