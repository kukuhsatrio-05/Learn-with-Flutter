import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Cottage Farm'),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 30.0),

                const Carousel(height: 180, width: double.infinity),

                const SizedBox(height: 30.0),

                const Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 15.0),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      CategoriesBox(
                        desc: 'Fruits',
                        imageUrl:
                            'https://i.pinimg.com/736x/a5/ac/66/a5ac660f85bf536ea4da81011c86f75d.jpg',
                      ),
                      SizedBox(width: 12),
                      CategoriesBox(
                        desc: 'Oats',
                        imageUrl:
                            'https://healthycornersby.com/wp-content/uploads/2019/09/WhatsApp-Image-2019-08-23-at-10.22.05.jpeg',
                      ),
                      SizedBox(width: 12),
                      CategoriesBox(
                        desc: 'Vegetables',
                        imageUrl:
                            'https://i0.wp.com/resepkoki.id/wp-content/uploads/2018/03/sayur-mayur-Cropped-1.jpg?fit=500%2C500&ssl=1',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  'Browse Products',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 15),

                Row(
                  children: [
                    SizedBox(
                      width: 150,
                      child: ProductItem(
                        title: 'Berries',
                        description: 'Lorem ipsum dolor sit amet, consectetur.',
                      ),
                    ),

                    const SizedBox(width: 20),

                    SizedBox(
                      width: 150,
                      child: ProductItem(
                        title: 'Tulsi',
                        description: 'Lorem ipsum dolor sit amet, consectetur.',
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    SizedBox(
                      width: 150,
                      child: ProductItem(
                        title: 'Sweet Potatoes',
                        description: 'Lorem ipsum dolor sit amet, consectetur.',
                      ),
                    ),

                    const SizedBox(width: 20),

                    SizedBox(
                      width: 150,
                      child: ProductItem(
                        title: 'Melon',
                        description: 'Lorem ipsum dolor sit amet, consectetur.',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Carousel extends StatelessWidget {
  final double height;
  final double width;

  const Carousel({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}

class ProductItem extends StatefulWidget {
  final String title;
  final String description;

  const ProductItem({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Carousel(height: 150, width: double.infinity),
        const SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
            ),
          ],
        ),

        const SizedBox(height: 5),
        Text(
          widget.description,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class CategoriesBox extends StatelessWidget {
  final String desc;
  final String imageUrl;

  const CategoriesBox({super.key, required this.desc, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: const Color(0xffDFF1E6),
        borderRadius: BorderRadius.circular(50.0),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(width: 10.0),

          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text(
              desc,
              style: TextStyle(fontSize: 14, color: Color(0xFF424242)),
            ),
          ),
        ],
      ),
    );
  }
}
