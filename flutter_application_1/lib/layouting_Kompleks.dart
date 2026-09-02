import 'package:flutter/material.dart';

void main() {
  runApp(const Mylayouting());
}

class Mylayouting extends StatelessWidget {
  const Mylayouting({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  width: 500,
                  height: 120,
                  color: Colors.deepPurple.shade100,
                ),
                const Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(Icons.notifications, color: Colors.red),
                ),
                const Align(
                  alignment: Alignment.topCenter,
                  child: Text('Berada di tengah atas'),
                ),
              ],
            ),
            Row(
              children: const [
                Text('Kiri'),
                Spacer(), // mengisi ruang kosong di tengah secara fleksibel
                Text('Kanan'),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(height: 40, color: Colors.orange),
                ),
                Expanded(
                  flex: 1,
                  child: Container(height: 40, color: Colors.blue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}