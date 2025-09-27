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

  final List<Map<String, String>> specialOffers = [
    {
      "title": "50% Off Keyboard",
      "image": "assets/keyPic.png",
      "desc": "Get half price on gaming keyboards!",
    },
    {
      "title": "Smart TV Deal",
      "image": "assets/a3.jpg",
      "desc": "Save big on 55-inch Smart TVs.",
    },
    {
      "title": "Wide Lens Discount",
      "image": "assets/yyy.jpg",
      "desc": "Photography lovers, grab 30% off!",
    },
    {
      "title": "Mouse Special",
      "image": "assets/tech.jpg",
      "desc": "High precision mouse at a discount.",
    },
    {
      "title": "Note Pad Offer",
      "image": "assets/a1.jpg",
      "desc": "Get 2 Note Pads for the price of 1!",
    },
  ];

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
            ListTile(
              leading: const Icon(Icons.language, color: Colors.purple),
              title: const Text('English'),
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
                    shadowColor: const Color.fromARGB(
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
                          const SizedBox(height: 18),
                          Text(
                            products[index],
                            style: const TextStyle(
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
                          const Spacer(),
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
                                        backgroundColor: Color.fromARGB(
                                          255,
                                          176,
                                          112,
                                          188,
                                        ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.add_shopping_cart,
                                    size: 18,
                                  ),
                                  label: const Text(''),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: const Color.fromARGB(
                                      255,
                                      176,
                                      112,
                                      188,
                                    ),
                                    elevation: 2,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Flexible(
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Center(child: Text('Saved')),
                                        duration: Duration(seconds: 1),
                                        width: 80,
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Color.fromARGB(
                                          255,
                                          176,
                                          112,
                                          188,
                                        ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.bookmark, size: 18),
                                  label: const Text(''),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: const Color.fromARGB(
                                      255,
                                      176,
                                      112,
                                      188,
                                    ),

                                    elevation: 2,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 70),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }, childCount: pic.length),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "🔥 Hot Offers",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple.shade800,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: specialOffers.length,
                itemBuilder: (context, index) {
                  final offer = specialOffers[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                offer["image"]!,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    offer["title"]!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 176, 112, 188),
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    offer["desc"]!,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.local_offer,
                              color: Colors.purple.shade600,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
