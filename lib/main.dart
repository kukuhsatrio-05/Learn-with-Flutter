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
                            'https://www.astronauts.id/blog/wp-content/uploads/2023/08/Jenis-Oat-Untuk-Diet-Yang-Mudah-Murah-dan-Sehat-1024x678.jpg',
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
                        rate: 4.9,
                        reviews: 789,
                        imgUrl:
                            'https://post.healthline.com/wp-content/uploads/2021/07/berries-1296x728-header.jpg',
                      ),
                    ),

                    const SizedBox(width: 20),

                    SizedBox(
                      width: 150,
                      child: ProductItem(
                        title: 'Parsley',
                        description: 'Lorem ipsum dolor sit amet, consectetur.',
                        rate: 4.9,
                        reviews: 898,
                        imgUrl:
                            'https://s3.ap-southeast-1.amazonaws.com/s.kalimoni-greens.com/curly-parsleyjtgbnp9b.webp',
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
                        rate: 4.9,
                        reviews: 788,
                        imgUrl:
                            'https://www.ipb.ac.id/wp-content/uploads/2025/07/Mengapa-Ubi-Cilembu-Lebih-Manis-Saat-Dipanggang-Ini-Penjelasan-Dosen-IPB-University.jpg',
                      ),
                    ),

                    const SizedBox(width: 20),

                    SizedBox(
                      width: 150,
                      child: ProductItem(
                        title: 'Melon',
                        description: 'Lorem ipsum dolor sit amet, consectetur.',
                        rate: 4.9,
                        reviews: 667,
                        imgUrl:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvZuvYEaoHm0ReVVzWFslfTHwN25MC8CLIZA&s',
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

class Carousel extends StatefulWidget {
  final double height;
  final double width;

  const Carousel({super.key, required this.height, required this.width});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<String> images = [
    'https://img.freepik.com/free-photo/composition-fresh-vegetables-blurred-vegetable-garden-background_169016-40138.jpg?semt=ais_hybrid&w=740&q=80',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyhs9cxIY8xlVGu2pm2344w5M3wPvqpYWv0w&s',
    'https://i0.wp.com/post.healthline.com/wp-content/uploads/2021/09/Jillian-Kubala-after-farm-1296x728-body1.jpg?w=1155&h=1528',
    'https://buffalohealthyliving.com/wp-content/uploads/photo-WestSideTilth.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height,
          width: widget.width,
          child: PageView.builder(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: NetworkImage(images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 8,
              width: _currentPage == 0 ? 20 : 8,
              decoration: BoxDecoration(
                color: _currentPage == 0 ? Colors.green : Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 8,
              width: _currentPage == 1 ? 20 : 8,
              decoration: BoxDecoration(
                color: _currentPage == 1 ? Colors.green : Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 8,
              width: _currentPage == 2 ? 20 : 8,
              decoration: BoxDecoration(
                color: _currentPage == 2 ? Colors.green : Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 8,
              width: _currentPage == 3 ? 20 : 8,
              decoration: BoxDecoration(
                color: _currentPage == 3 ? Colors.green : Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ProductItem extends StatefulWidget {
  final String title;
  final String description;
  final String imgUrl;
  final double rate;
  final int reviews;

  const ProductItem({
    super.key,
    required this.title,
    required this.description,
    required this.imgUrl,
    required this.rate,
    required this.reviews,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              title: widget.title,
              imageUrl: widget.imgUrl,
              rating: widget.rate,
              reviewCount: widget.reviews,
              description: widget.description,
            ),
          ),
        );
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(widget.imgUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.3),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            Text(
              widget.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),

            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                const SizedBox(width: 4),
                Text(
                  widget.rate.toString(),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  '(${widget.reviews})',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 6),

            Text(
              widget.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final String description;

  const ProductDetailPage({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 350,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withValues(alpha: 0.5),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 10,
                  right: 10,
                  child: SafeArea(
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withValues(alpha: 0.5),
                      child: Icon(Icons.favorite_border, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                          const SizedBox(width: 5),
                          Text(
                            '$rating ($reviewCount)',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
