import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  final String title;
  const Products({super.key, required this.title});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List pic = [
    'assets/keyPic.png',
    'assets/tech.jpg',
    'assets/a1.jpg',
    'assets/a2.jpg',
    'assets/a3.jpg',
    'assets/yyy.jpg',
  ];
  List products = [
    'Keyboard',
    'Mouse',
    'Car viewcam',
    'Note Pad',
    'Smart TV',
    'WideAngle Lens',
  ];
  List price = [
    '1500 EGP',
    '700 EGP',
    '3000 EGP',
    '300 EGP',
    '14000 EGP',
    '1200 EGP',
  ];
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 228, 226, 226),
              ),
              child: Text(
                'Shop Tech',
                style: TextStyle(
                  color: Color.fromARGB(255, 176, 112, 188),
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag, color: Colors.purple),
              title: const Text('Products'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.purple),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Our Products',
          style: TextStyle(color: Color.fromARGB(255, 176, 112, 188)),
        ),
        elevation: 2,
        actions: [
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: Icon(
              Icons.shopping_cart,
              color: Color.fromARGB(255, 176, 112, 188),
            ),
          ),
        ],
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFe0c3fc), Color(0xFF8ec5fc)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 180,
                child: PageView.builder(
                  controller: PageController(viewportFraction: 0.9),
                  itemCount: pic.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 12.0,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          pic[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.7,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    shadowColor: Color.fromARGB(
                      255,
                      176,
                      112,
                      188,
                    ).withOpacity(0.3),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: SizedBox(
                              width: double.infinity,
                              height: 100,
                              child: Image.asset(pic[index], fit: BoxFit.cover),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            products[index],
                            style: TextStyle(
                              color: Color.fromARGB(255, 176, 112, 188),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            price[index],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(height: 6),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Flexible(
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Center(
                                          child: Text('Added to cart!'),
                                        ),
                                        duration: Duration(seconds: 1),
                                        width: 150,
                                        behavior: SnackBarBehavior.floating,
                                      ),
                                    );
                                  },
                                  icon: Icon(Icons.shopping_cart, size: 18),
                                  label: Text(''),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Color.fromARGB(
                                      255,
                                      176,
                                      112,
                                      188,
                                    ),
                                    elevation: 2,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 6),
                              Flexible(
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Center(child: Text('Saved')),
                                        duration: Duration(seconds: 1),
                                        width: 80,
                                        behavior: SnackBarBehavior.floating,
                                      ),
                                    );
                                  },
                                  icon: Icon(Icons.bookmark, size: 18),
                                  label: Text(''),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Color.fromARGB(
                                      255,
                                      176,
                                      112,
                                      188,
                                    ),
                                    elevation: 2,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }, childCount: pic.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
