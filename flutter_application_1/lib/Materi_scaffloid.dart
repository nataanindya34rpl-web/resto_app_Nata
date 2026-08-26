import 'package:flutter/material.dart';

class ScaffoldWidget extends StatefulWidget {
  const ScaffoldWidget({super.key});

  @override
  State<ScaffoldWidget> createState() => _ScaffoldWidgetState();
}

class _ScaffoldWidgetState extends State<ScaffoldWidget> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Sample Code')),
        body: Center(child: Text('You have pressed the button $_count times.')),
        bottomNavigationBar: BottomAppBar(child: Container(height: 50.0)),
        floatingActionButton: FloatingActionButton(
          onPressed: _increment,
          tooltip: 'Increment Counter',
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}