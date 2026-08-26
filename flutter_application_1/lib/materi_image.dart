import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  const MyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text('Aplikasi Saya'))),
        body: Center(
          child: Image.asset('assets/bunny.jpg', width: 200, height: 200),
        ),
      ),
    );
  }
}