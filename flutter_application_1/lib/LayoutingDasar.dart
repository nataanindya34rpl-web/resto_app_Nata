import 'package:flutter/material.dart';
void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const Text('Baris atas'),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Berjajar ke samping'),
                ),
              ],
            ),
            Container(
              width: 100,
              height: 40,
              color: Colors.deepPurple,
              child: const Center(child:Text('Container',style:TextStyle(color:Colors.white))),
            )
            ],
          ),
        ),
      );
  }
}