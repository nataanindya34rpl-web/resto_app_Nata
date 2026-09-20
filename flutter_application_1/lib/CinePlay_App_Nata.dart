import 'package:flutter/material.dart';

void main() {
  runApp(const CinePlayApp());
}

class CinePlayApp extends StatelessWidget {
  const CinePlayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CinePlay App',

      initialRoute: '/login',

      routes: {
        '/login': (context) => const LoginPage(),
        '/main': (context) => const MainNavigationPage(),
      },
    );
  }
}

//Login
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CinePlay'),
        backgroundColor: const Color.fromARGB(255, 228, 90, 80),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.movie,
              size: 90,
              color: Color.fromARGB(255, 255, 89, 77),
            ),

            const SizedBox(height: 20),

            const Text(
              'CinePlay App',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            const TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    '/main',
                  );
                },
                child: const Text('Masuk'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Navigation
class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() =>
      _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    MovieListPage(),
    JadwalBioskopPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,

        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Film',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Jadwal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

//Daftar film
class MovieListPage extends StatelessWidget {
  const MovieListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> movies = [
      {
        'judul': 'Moana 2',
        'genre': 'Animation, Adventure',
        'rating': 4.3,
        'sinopsis':
            'Moana kembali melakukan perjalanan baru bersama teman-temannya.',
      },
      {
        'judul': 'Interstellar',
        'genre': 'Sci-Fi, Adventure',
        'rating': 4.5,
        'sinopsis':
            'Perjalanan luar angkasa untuk mencari tempat tinggal baru bagi manusia.',
      },
      {
        'judul': 'The Conjuring',
        'genre': 'Horror, Mystery',
        'rating': 4.6,
        'sinopsis':
            'Sebuah keluarga mengalami kejadian misterius di rumah baru mereka.',
      },
      {
        'judul': 'Jumbo',
        'genre': 'Animation, Family',
        'rating': 4.4,
        'sinopsis':
            'Kisah petualangan dan persahabatan seorang anak dengan teman barunya.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Film Tayang'),
        backgroundColor: Colors.red,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: movies.length,

        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              final hasil = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailMoviePage(
                    judul: movies[index]['judul'],
                    genre: movies[index]['genre'],
                    rating: movies[index]['rating'],
                    sinopsis: movies[index]['sinopsis'],
                  ),
                ),
              );

              if (hasil != null) {
                debugPrint('Film dipilih: $hasil');
              }
            },

            child: Card(
              margin: const EdgeInsets.only(bottom: 15),

              child: Padding(
                padding: const EdgeInsets.all(18),

                child: Row(
                  children: [
                    const Icon(
                      Icons.movie,
                      size: 65,
                      color: Colors.red,
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            movies[index]['judul'],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 5),

                          Text(
                            movies[index]['genre'],
                          ),

                          const SizedBox(height: 5),

                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),

                              const SizedBox(width: 5),

                              Text(
                                '${movies[index]['rating']}',
                              ),
                            ],
                          ),

                          const SizedBox(height: 5),

                          const Text(
                            'Tekan untuk melihat detail',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Detail film
class DetailMoviePage extends StatelessWidget {
  final String judul;
  final String genre;
  final double rating;
  final String sinopsis;

  const DetailMoviePage({
    super.key,
    required this.judul,
    required this.genre,
    required this.rating,
    required this.sinopsis,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(judul),
        backgroundColor: Colors.red,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Center(
              child: Icon(
                Icons.movie,
                size: 120,
                color: Colors.red,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              judul,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              'Genre: $genre',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 25,
                ),

                const SizedBox(width: 5),

                Text(
                  'Rating: $rating',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            const Text(
              'Sinopsis',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              sinopsis,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    judul,
                  );
                },

                child: const Text('Kembali'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Jadwal Bioskop
class JadwalBioskopPage extends StatelessWidget {
  const JadwalBioskopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> studio = [
      'Studio Regular',
      'Studio IMAX 3D',
      'Velvet VIP',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal Bioskop'),
        backgroundColor: Colors.red,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: studio.length,

        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 15),

            child: ListTile(
              leading: const Icon(
                Icons.local_movies,
                color: Colors.red,
              ),

              title: Text(
                studio[index],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              trailing: const Icon(
                Icons.arrow_forward_ios,
              ),

              onTap: () async {
                final hasil = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailJadwalPage(
                      studio: studio[index],
                    ),
                  ),
                );

                if (hasil != null) {
                  debugPrint('Studio dipilih: $hasil');
                }
              },
            ),
          );
        },
      ),
    );
  }
}

// Detail jadwal
class DetailJadwalPage extends StatelessWidget {
  final String studio;

  const DetailJadwalPage({
    super.key,
    required this.studio,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Jadwal'),
        backgroundColor: Colors.red,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              studio,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Jadwal Film',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const ListTile(
              leading: Icon(Icons.movie),
              title: Text('Moana 2'),
              subtitle: Text('13:00'),
            ),

            const ListTile(
              leading: Icon(Icons.movie),
              title: Text('Interstellar'),
              subtitle: Text('15:30'),
            ),

            const ListTile(
              leading: Icon(Icons.movie),
              title: Text('The Conjuring'),
              subtitle: Text('18:00'),
            ),

            const ListTile(
              leading: Icon(Icons.movie),
              title: Text('Jumbo'),
              subtitle: Text('20:30'),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    studio,
                  );
                },

                child: const Text('Kembali'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Profile
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.red,
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const CircleAvatar(
            radius: 55,
              backgroundImage: AssetImage(
              'assets/Fotokuu.jpg.',
            ),
           ),
          const SizedBox(height: 15),

          const Center(
            child: Text(
              'Nata Parahita',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Center(
            child: Text(
              'Pengguna CinePlay',
            ),
          ),

          const SizedBox(height: 30),

          const Text(
            'Riwayat Pemesanan',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          const Card(
            child: ListTile(
              leading: Icon(
                Icons.confirmation_num,
              ),
              title: Text('Moana 2'),
              subtitle: Text(
                'Studio IMAX 3D - 13:00',
              ),
            ),
          ),

          const Card(
            child: ListTile(
              leading: Icon(
                Icons.confirmation_num,
              ),
              title: Text('Interstellar'),
              subtitle: Text(
                'Studio Regular - 15:30',
              ),
            ),
          ),

          const SizedBox(height: 25),

          // LOGOUT
          SizedBox(
            width: double.infinity,

            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (route) => false,
                );
              },

              icon: const Icon(
                Icons.logout,
              ),

              label: const Text(
                'Logout',
              ),
            ),
          ),
        ],
      ),
    );
  }
}