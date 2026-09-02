import 'package:flutter/material.dart';

void main() {
  runApp(const Myminii());
}

class Myminii extends StatelessWidget {
  const Myminii({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Widget Flutter',
      home: ProfileCardPage(),
    );
  }
}

// 1. HALAMAN UTAMA (StatefulWidget)
class ProfileCardPage extends StatefulWidget {
  const ProfileCardPage({super.key});

  @override
  State<ProfileCardPage> createState() => _ProfileCardPageState();
}

class _ProfileCardPageState extends State<ProfileCardPage> {
  // State favorit terpisah untuk tiap kartu
  bool isFavorite1 = false;
  bool isFavorite2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kartu Profil Siswa')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: [
              // Kartu 1
              Expanded(
                child: ProfileCard(
                  name: 'Nata Parahita',
                  role: 'Siswa XI RPL 7',
                  email: 'natapara@gmail.com',
                  isFavorite: isFavorite1,
                  onFavoritePressed: () {
                    setState(() {
                      isFavorite1 = !isFavorite1;
                    });
                  },
                ),
              ),

              const SizedBox(width: 10), // Jarak antarkartu

              // Kartu 2
              Expanded(
                child: ProfileCard(
                  name: 'Bagus Nugroho',
                  role: 'Siswa XI RPL 7',
                  email: 'bagus@gmail.com',
                  isFavorite: isFavorite2,
                  onFavoritePressed: () {
                    setState(() {
                      isFavorite2 = !isFavorite2;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// WIDGET KARTU PROFIL 
class ProfileCard extends StatelessWidget {
  final String name;
  final String role;
  final String email;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;

  const ProfileCard({
    super.key,
    required this.name,
    required this.role,
    required this.email,
    required this.isFavorite,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.teal.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.person,
                  size: 36,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(role, style: const TextStyle(fontSize: 11)),
              Text(email, style: const TextStyle(fontSize: 9)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onFavoritePressed,
                      child: Text(
                        isFavorite ? 'Favorit' : 'TambahFavorit',
                        style: const TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Icon Love 
          Positioned(
            top: 0,
            left: 0,
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
          ),

          // lonceng
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.notifications,
                size: 14,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}