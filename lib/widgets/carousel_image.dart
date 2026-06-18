import 'package:flutter/material.dart';

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
