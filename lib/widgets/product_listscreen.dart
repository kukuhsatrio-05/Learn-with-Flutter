import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/product_provider.dart';
import '../widgets/offline_banner.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<ProductProvider>().fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Produk')),
      body: Column(
        children: [
          if (provider.isOffline) const OfflineBanner(),

          Expanded(child: _buildBody(provider)),
        ],
      ),
    );
  }

  Widget _buildBody(ProductProvider provider) {
    if (provider.status == FetchStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.isOffline && provider.products.isNotEmpty) {
      return _buildProductList(provider);
    }

    if (provider.status == FetchStatus.error) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 50),
            const SizedBox(height: 10),
            Text(provider.errorMessage),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                context.read<ProductProvider>().fetchProducts();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Coba Lagi'),
            ),
          ],
        ),
      );
    }

    if (provider.status == FetchStatus.success) {
      return _buildProductList(provider);
    }

    return const SizedBox.shrink();
  }

  Widget _buildProductList(ProductProvider provider) {
    return ListView.builder(
      itemCount: provider.products.length,
      itemBuilder: (context, index) {
        final product = provider.products[index];

        return ListTile(
          leading: Image.network(
            product.image,
            width: 50,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.broken_image, size: 50),
          ),
          title: Text(product.title),
          subtitle: Text('\$${product.price}'),
        );
      },
    );
  }
}
