import 'package:flutter/material.dart';

void main() {
  runApp(const Myminii());
}

class Myminii extends StatelessWidget {
  const Myminii({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flash Sale',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class Product {
  final String name;
  final int oldPrice;
  final int price;
  final int discount;
  final IconData icon;
  final String imageUrl;

  const Product({
    required this.name,
    required this.oldPrice,
    required this.price,
    required this.discount,
    required this.icon,
    required this.imageUrl,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final products = const [
    Product(
      name: 'Sepatu Sneaker',
      oldPrice: 150000,
      price: 75000,
      discount: 50,
      icon: Icons.shopping_bag,
      imageUrl:
          'https://id-live-01.slatic.net/p/55336cf70592b7996fdcbc3d727e1b05.jpg',
    ),
    Product(
      name: 'Jam Tangan Digital',
      oldPrice: 300000,
      price: 210000,
      discount: 30,
      icon: Icons.watch,
      imageUrl:
          'https://static-id.zacdn.com/p/digitec-smart-watch-1238-0227954-8.jpg',
    ),
  ];

  final cart = <Product>[];
  final wishlist = <String>{};
  final remaining = const Duration(hours: 2, minutes: 15, seconds: 40);

  String formatRupiah(int price) => price.toString().replaceAllMapped(
    RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
    (match) => '${match[1]}.',
  );

  String get countdown {
    String digits(int value) => value.toString().padLeft(2, '0');
    return '${digits(remaining.inHours)}:${digits(remaining.inMinutes.remainder(60))}:${digits(remaining.inSeconds.remainder(60))}';
  }

  void addToCart(Product product) {
    setState(() => cart.add(product));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${product.name} masuk ke keranjang')),
    );
  }

  void removeFromCart(Product product) => setState(() => cart.remove(product));

  void toggleWishlist(Product product) {
    setState(() {
      wishlist.contains(product.name)
          ? wishlist.remove(product.name)
          : wishlist.add(product.name);
    });
  }

  void showCart() => showModalBottomSheet(
    context: context,
    builder: (context) => SizedBox(
      height: 450,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Keranjang Saya (${cart.length})',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ...cart.map(
            (product) => ListTile(
              leading: Icon(product.icon),
              title: Text(product.name),
              subtitle: Text('Rp ${formatRupiah(product.price)}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  removeFromCart(product);
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    ),
  );

  void showPromo() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('⚡ Flash Sale 9.9'),
          content: const Text(
            'Dapatkan berbagai produk dengan diskon hingga 50%!',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // App Bar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Flash Sale',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: showCart,
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                  size: 28,
                ),
              ),

              if (cart.isNotEmpty)
                Positioned(
                  right: 4,
                  top: 4,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${cart.length}',
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
          const SizedBox(width: 8),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, thickness: 1, color: Colors.grey),
        ),
      ),

      // Body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Promo
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 248, 150, 3),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '⚡ FLASH SALE 9.9',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  Text(
                    'Berakhir dalam $countdown',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Daftar Produk
            const Text(
              'Daftar Produk',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(
                  product: product,
                  isFavorite: wishlist.contains(product.name),
                  onToggleWishlist: () => toggleWishlist(product),
                  onAddCart: () => addToCart(product),
                  formatPrice: formatRupiah,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final bool isFavorite;
  final VoidCallback onToggleWishlist;
  final VoidCallback onAddCart;
  final String Function(int) formatPrice;

  const ProductCard({
    super.key,
    required this.product,
    required this.isFavorite,
    required this.onToggleWishlist,
    required this.onAddCart,
    required this.formatPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform.translate(
                  offset: const Offset(0, -4),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      '${product.discount}% OFF',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: onToggleWishlist,
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  width: double.infinity,
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Icon(
                      product.icon,
                      size: 75,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              'Rp ${formatPrice(product.oldPrice)}',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            Text(
              'Rp ${formatPrice(product.price)}',
              style: const TextStyle(
                fontSize: 17,
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: onAddCart,
                icon: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Icon(Icons.add_shopping_cart, size: 18),
                ),
                label: const Text('Keranjang'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
