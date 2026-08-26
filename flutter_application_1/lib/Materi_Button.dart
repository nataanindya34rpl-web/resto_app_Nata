import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Button pressed!');
          },
          backgroundColor: const Color.fromARGB(255, 99, 71, 212),
          elevation: 0,
          hoverElevation: 0,
          focusElevation: 0,
          highlightElevation: 0,
          child: Icon(Icons.thumb_up),
        ),
      ),
    );
  }
}