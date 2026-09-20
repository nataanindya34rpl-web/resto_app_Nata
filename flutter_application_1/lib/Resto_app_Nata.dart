import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
// Widget Utama
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MenuPage(),
    );
  }
}

// Halaman Menu
class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // Jumlah porsi dari masing-masing kartu
  int porsiNasiGoreng = 0;
  int porsiMieGoreng = 0;

  // Menghitung total porsi kedua menu
  int get totalPorsi {
    return porsiNasiGoreng + porsiMieGoreng;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resto Nata - Absen 28'),
        backgroundColor: Colors.orange,
      ),

      body: Column(
        children: [
          const SizedBox(height: 20),

          // Dua menu berdampingan
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Kartu 1: Nasi Goreng
              Expanded(
                child: MenuCard(
                  namaMenu: 'Nasi Goreng Nata',
                  harga: 'Rp 43.000',
                  badgeText: 'PROMO DISKON',

                  // jumlah Nasi Goreng berubah
                  onJumlahChanged: (jumlah) {
                    setState(() {
                      porsiNasiGoreng = jumlah;
                    });
                  },
                ),
              ),

              const SizedBox(width: 12),

              // Kartu 2: Mie Goreng
              Expanded(
                child: MenuCard(
                  namaMenu: 'Mie Goreng Nata',
                  harga: 'Rp 45.000',
                  badgeText: 'PROMO DISKON',

                  // Ketika jumlah Mie Goreng berubah
                  onJumlahChanged: (jumlah) {
                    setState(() {
                      porsiMieGoreng = jumlah;
                    });
                  },
                ),
              ),
            ],
          ),
          const Spacer(),

          // Rekap total porsi
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Total Porsi: $totalPorsi',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget Kartu Menu
class MenuCard extends StatefulWidget {
  final String namaMenu;
  final String harga;
  final String badgeText;

  // Callback untuk mengirim jumlah porsi ke MenuPage
  final ValueChanged<int> onJumlahChanged;
  const MenuCard({
    super.key,
    required this.namaMenu,
    required this.harga,
    required this.badgeText,
    required this.onJumlahChanged,
  });

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  int jumlahPesan = 0;

  // Menambah jumlah pesanan
  void tambahPesanan() {
    setState(() {
      jumlahPesan++;
    });

    // Kirim jumlah terbaru ke MenuPage
    widget.onJumlahChanged(jumlahPesan);
  }

  // Mengurangi jumlah pesanan
  void kurangiPesanan() {
    if (jumlahPesan > 0) {
      setState(() {
        jumlahPesan--;
      });

      // Kirim jumlah terbaru ke MenuPage
      widget.onJumlahChanged(jumlahPesan);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.amber.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.orange.shade200,
        ),
      ),

      child: Stack(
        children: [

          // Isi Kartu
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 25),

              const Icon(
                Icons.fastfood,
                size: 50,
                color: Colors.orange,
              ),

              const SizedBox(height: 8),

              Text(
                widget.namaMenu,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                widget.harga,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 12),

              // Tombol tambah dan kurangi pesanan
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: kurangiPesanan,
                    icon: const Icon(Icons.remove),
                  ),

                  Text(
                    '$jumlahPesan',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  IconButton(
                    onPressed: tambahPesanan,
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),

          // Badge kiri atas
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                widget.badgeText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Badge jumlah pesanan kanan atas
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.deepOrange,
                shape: BoxShape.circle,
              ),
              child: Text(
                '$jumlahPesan',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}