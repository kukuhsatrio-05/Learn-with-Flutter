import 'package:flutter/material.dart';
import 'package:flutter_app_workshop/widgets_ui/product_detail.dart';
import 'package:flutter_app_workshop/view_model/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductItem extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteList = ref.watch(favoriteProvider);
    final bool isFavorite = favoriteList.contains(title);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              title: title,
              imageUrl: imgUrl,
              rating: rate,
              reviewCount: reviews,
              description: description,
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
                      image: NetworkImage(imgUrl),
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
                        if (isFavorite) {
                          ref
                              .read(favoriteProvider.notifier)
                              .state = favoriteList
                              .where((name) => name != title)
                              .toList();
                        } else {
                          ref.read(favoriteProvider.notifier).state = [
                            ...favoriteList,
                            title,
                          ];
                        }
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
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),

            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                const SizedBox(width: 4),
                Text(
                  rate.toString(),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  '($reviews)',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 6),

            Flexible(
              child: Text(
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
