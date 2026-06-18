import 'package:flutter/material.dart';

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
