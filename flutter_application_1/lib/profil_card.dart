import 'package:flutter/material.dart';

class Myminiii extends StatelessWidget {
  const Myminiii({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Widget Flutter',
      home: MainNavigationPage(),
    );
  }
}

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const ProfileCardPage(),
    const JadwalPage(),
    const PengaturanPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          BottomNavigationBarItem(icon: Icon(Icons.schedule), label: 'Jadwal'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        ],
      ),
    );
  }
}

class ProfileCardPage extends StatefulWidget {
  const ProfileCardPage({super.key});

  @override
  State<ProfileCardPage> createState() => _ProfileCardPageState();
}

class _ProfileCardPageState extends State<ProfileCardPage> {
  bool isFavorite1 = false;
  bool isFavorite2 = false;

  void bukaDetail(String nama, String kelas) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailProfilePage(nama: nama, kelas: kelas),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kartu Profil Siswa')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                child: ProfileCard(
                  name: 'Nata Parahita Anindya',
                  role: 'Siswa XI RPL 7',
                  email: 'nataparaa@gmail.com',
                  isFavorite: isFavorite1,
                  onFavoritePressed: () {
                    setState(() {
                      isFavorite1 = !isFavorite1;
                    });
                  },
                  onCardPressed: () {
                    bukaDetail('Nata Parahita Anindya', 'XI RPL 7');
                  },
                ),
              ),

              const SizedBox(width: 10),

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
                  onCardPressed: () {
                    bukaDetail('Bagus Nugroho', 'XI RPL 7');
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

class ProfileCard extends StatelessWidget {
  final String name;
  final String role;
  final String email;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;
  final VoidCallback onCardPressed;

  const ProfileCard({
    super.key,
    required this.name,
    required this.role,
    required this.email,
    required this.isFavorite,
    required this.onFavoritePressed,
    required this.onCardPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCardPressed,
      borderRadius: BorderRadius.circular(12),
      child: Container(
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

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onFavoritePressed,
                    child: Text(isFavorite ? 'Favorit' : 'Tambah Favorit'),
                  ),
                ),
              ],
            ),

            Positioned(
              top: 0,
              left: 0,
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
            ),

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
      ),
    );
  }
}

class DetailProfilePage extends StatelessWidget {
  final String nama;
  final String kelas;

  const DetailProfilePage({super.key, required this.nama, required this.kelas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profil $nama')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.deepPurple,
              child: Icon(Icons.person, size: 65, color: Colors.white),
            ),

            const SizedBox(height: 20),

            Text(
              nama,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(
              kelas,
              style: const TextStyle(fontSize: 17, color: Colors.black54),
            ),

            const SizedBox(height: 20),

            const Text(
              'Profil Siswa',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class JadwalPage extends StatelessWidget {
  const JadwalPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal Pelajaran'),
        backgroundColor: Colors.deepPurple.shade100,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calendar_month, size: 60, color: Colors.deepPurple),
            SizedBox(height: 12),
            Text('Halaman Jadwal Pelajaran', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

class PengaturanPage extends StatelessWidget {
  const PengaturanPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        backgroundColor: Colors.deepPurple.shade100,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.settings, size: 60, color: Colors.deepPurple),
            SizedBox(height: 12),
            Text('Halaman Pengaturan Aplikasi', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}