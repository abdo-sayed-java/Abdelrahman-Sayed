import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  final String title;
  const Products({super.key, required this.title});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  changLang() {
    if (context.locale == Locale('en', 'US')) {
      context.setLocale(Locale('ar', 'EG'));
    } else {
      context.setLocale(Locale('en', 'US'));
    }
  }

  @override
  Widget build(BuildContext context) {
    List pic = [
      'assets/keyPic.png',
      'assets/tech.jpg',
      'assets/a1.jpg',
      'assets/a2.jpg',
      'assets/a3.jpg',
      'assets/yyy.jpg',
    ];
    List products = [
      tr("Keyboard"),
      tr("Mouse"),
      tr("Car viewcam"),
      tr("Note Pad"),
      tr("Smart TV"),
      tr("WideAngle Lens"),
    ];
    List price = [
      tr("price k"),
      tr("price m"),
      tr("price c"),
      tr("price n"),
      tr("price tv"),
      tr("price w"),
    ];

    final List<Map<String, String>> specialOffers = [
      {
        "title": tr("offer k"),
        "image": "assets/keyPic.png",
        "disc": tr("disc k"),
      },
      {
        "title": tr("offer tv"),
        "image": "assets/a3.jpg",
        "disc": tr("disc tv"),
      },
      {"title": tr("offer w"), "image": "assets/yyy.jpg", "disc": tr("disc w")},
      {
        "title": tr("offer m"),
        "image": "assets/tech.jpg",
        "disc": tr("disc m"),
      },
      {"title": tr("offer n"), "image": "assets/a1.jpg", "disc": tr("disc n")},
    ];

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 228, 226, 226),
              ),
              child: Text(
                tr("appName"),
                style: TextStyle(
                  color: Color.fromARGB(255, 176, 112, 188),
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag, color: Colors.purple),
              title: Text(tr("pro")),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.language, color: Colors.purple),
              title: Text(tr("lang")),
              onTap: () {
                changLang();
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.purple),
              title: Text(tr("logout")),
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
        title: Text(
          tr("our pro"),
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
                                      SnackBar(
                                        content: Center(
                                          child: Text(tr("added to cart mass")),
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
                                      SnackBar(
                                        content: Center(
                                          child: Text(tr("saved mass")),
                                        ),
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
                              const SizedBox(height: 60),
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
                  tr("hot offers"),
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
                                    offer["disc"]!,
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
