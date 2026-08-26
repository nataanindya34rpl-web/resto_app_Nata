import 'package:flutter/material.dart';

void main() {
  runApp(const GymProApp());
}

class GymProApp extends StatelessWidget {
  const GymProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'GymPro',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                const Icon(
                  Icons.fitness_center,
                  size: 150,
                ),

                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Masuk',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      'Daftar',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                TextButton(
                  onPressed: () {},
                  child: const Text('Lewati'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
