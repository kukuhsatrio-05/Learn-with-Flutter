import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/product_provider.dart';
import 'widgets/product_listscreen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ProductProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductListScreen(),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_app_workshop/widgets/categories_box.dart';
// import 'package:flutter_app_workshop/widgets/product_item.dart';
// import 'package:flutter_app_workshop/widgets/carousel_image.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_app_workshop/view_model/providers.dart';

// void main() {
//   runApp(const ProviderScope(child: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(fontFamily: 'Courier'),
//       home: const HomePage(),
//     );
//   }
// }

// class HomePage extends ConsumerWidget {
//   const HomePage({super.key});
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final products = ref.watch(productListProvider);

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('Cottage Farm'),
//         backgroundColor: Colors.white,
//         surfaceTintColor: Colors.transparent,
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: ListView(
//             children: [
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Search...',
//                   hintStyle: TextStyle(color: Colors.grey),
//                   prefixIcon: const Icon(Icons.search),
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(32.0),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 30.0),

//               const Carousel(height: 180, width: double.infinity),

//               const SizedBox(height: 30.0),

//               const Text(
//                 'Categories',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.grey,
//                 ),
//               ),

//               const SizedBox(height: 15.0),

//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: const [
//                     CategoriesBox(
//                       desc: 'Fruits',
//                       imageUrl:
//                           'https://i.pinimg.com/736x/a5/ac/66/a5ac660f85bf536ea4da81011c86f75d.jpg',
//                     ),
//                     SizedBox(width: 12),
//                     CategoriesBox(
//                       desc: 'Oats',
//                       imageUrl:
//                           'https://healthycornersby.com/wp-content/uploads/2019/09/WhatsApp-Image-2019-08-23-at-10.22.05.jpeg',
//                     ),
//                     SizedBox(width: 12),
//                     CategoriesBox(
//                       desc: 'Vegetables',
//                       imageUrl:
//                           'https://www.astronauts.id/blog/wp-content/uploads/2023/08/Jenis-Oat-Untuk-Diet-Yang-Mudah-Murah-dan-Sehat-1024x678.jpg',
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 30),

//               const Text(
//                 'Browse Products',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.grey,
//                 ),
//               ),

//               const SizedBox(height: 15),

//               GridView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 20,
//                   mainAxisSpacing: 5,
//                   childAspectRatio: 0.50,
//                 ),
//                 itemCount: products.length,
//                 itemBuilder: (context, index) {
//                   final item = products[index];

//                   return ProductItem(
//                     title: item.title,
//                     description: item.description,
//                     imgUrl: item.imageUrl,
//                     rate: item.rate,
//                     reviews: item.reviews,
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
