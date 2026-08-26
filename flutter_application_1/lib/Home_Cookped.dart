import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const makanan = [
    [
      'Ayam Bakar',
      'https://i0.wp.com/resepkoki.id/wp-content/uploads/2017/11/Resep-Ayam-bakar-bumbu-bali.jpg?fit=500%2C542&ssl=1',
    ],
    [
      'Bolu Pisang',
      'https://i0.wp.com/resepkoki.id/wp-content/uploads/2022/06/Resep-Bolu-Coklat-Pisang-Kukus.jpg?fit=500%2C666&ssl=1',
    ],
    [
      'Soto Ayam',
      'https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/a8ec718b-ac5c-4e0f-92d9-a579238bf35a_Go-Biz_20241212_204509.jpeg',
    ],
    [
      'Rawon',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHSTj3kxrhVD5vQmjaHKfOsLGAS4FHG44O1-aaEqMXg9w7-IgcOUK-gu1A&s=10',
    ],
    [
      'Nasi Goreng',
      'https://assets.unileversolutions.com/recipes-v2/258052.jpg',    
    ],
    [
      'Nasi campur',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRD6rVw2VNk5_5lv6XqG0f22reGCtsXGxhOr-STZYHdMnMW8IYAMJ32eRo&s=10',    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              // HEADER
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 12),
                child: Row(
                  children: [

                    Container(
                      width: 45,
                      height: 45,
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                          child: const Icon(
                        Icons.restaurant,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),



                    const SizedBox(width: 10),

                    const Text(
                      'Cookpad',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff5a1111),
                      ),
                    ),

                    const Spacer(),

                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.notifications_none,
                        size: 27,
                      ),
                    ),
                  ],
                ),
              ),

              // SEARCH
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xfff8f7f5),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Row(
                  children: [

                    SizedBox(width: 15),

                    Icon(
                      Icons.search,
                      size: 24,
                      color: Colors.grey,
                    ),

                    SizedBox(width: 10),

                    Text(
                      'Ketik bahan-bahan...',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // BANNER
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 180,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtZpGhtI1_NohWzsEISDJ7V5fvifHAU5-JmVmfts6v2Q&s=10',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey.shade200,
                        child: const Icon(
                          Icons.image_not_supported,
                          size: 40,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // JUDUL
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Pencarian Populer',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // GRID MAKANAN
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: makanan.length,

                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.9,
                  ),

                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8),

                      child: Stack(
                        fit: StackFit.expand,
                        children: [

                          // GAMBAR MAKANAN
                          Image.network(
                            makanan[index][1],
                            fit: BoxFit.cover,

                            errorBuilder:
                                (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey.shade200,
                                child: const Icon(
                                  Icons.image_not_supported,
                                  color: Colors.grey,
                                ),
                              );
                            },
                          ),

                          // NAMA MAKANAN
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 3,
                              ),
                              color: const Color.fromARGB(133, 0, 0, 0),

                              child: Text(
                                makanan[index][0],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}