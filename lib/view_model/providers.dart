import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class Product {
  final String title;
  final String imageUrl;
  final String description;
  final int reviews;
  final double rate;

  Product({
    required this.title,
    required this.reviews,
    required this.rate,
    required this.description,
    required this.imageUrl,
  });
}

final favoriteProvider = StateProvider<List<String>>((ref) => []);
final productListProvider = Provider<List<Product>>((ref) {
  return [
    Product(
      title: 'Berries',
      rate: 4.9,
      reviews: 789,
      description: 'Lorem ipsum dolor sit amet, consectetur.',
      imageUrl:
          'https://post.healthline.com/wp-content/uploads/2021/07/berries-1296x728-header.jpg',
    ),
    Product(
      title: 'Parsley',
      rate: 4.9,
      reviews: 898,
      description: 'Lorem ipsum dolor sit amet, consectetur.',
      imageUrl:
          'https://s3.ap-southeast-1.amazonaws.com/s.kalimoni-greens.com/curly-parsleyjtgbnp9b.webp',
    ),
    Product(
      title: 'Sweet Potatoes',
      description: 'Lorem ipsum dolor sit amet, consectetur.',
      rate: 4.9,
      reviews: 788,
      imageUrl:
          'https://www.ipb.ac.id/wp-content/uploads/2025/07/Mengapa-Ubi-Cilembu-Lebih-Manis-Saat-Dipanggang-Ini-Penjelasan-Dosen-IPB-University.jpg',
    ),
    Product(
      title: 'Melon',
      description: 'Lorem ipsum dolor sit amet, consectetur.',
      rate: 4.9,
      reviews: 667,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvZuvYEaoHm0ReVVzWFslfTHwN25MC8CLIZA&s',
    ),
  ];
});
