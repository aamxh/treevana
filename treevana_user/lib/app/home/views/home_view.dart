import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treevana_user/app/products/views/products_view.dart';
import 'package:treevana_user/app/settings/views/settings_view.dart';
import 'package:treevana_user/app/products/views/products_view.dart';
import '../controllers/home_controller.dart';
import 'package:treevana_user/app/common/models/product_model.dart';

class HomeView extends GetView<HomeController> {

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Treevana',
          style: theme.textTheme.headlineMedium!.copyWith(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.view_headline_outlined,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () => Get.to(() => SettingsView()),
          ),
        ],
      ),
      body: Obx(() {
        final products = controller.products;
        if (products.isEmpty) {
          return const Center(
            child: Text('No products available right now 🌱'),
          );
        }
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          children: [
            SizedBox(height: size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Featured Products',
                  style: theme.textTheme.titleMedium,
                ),
                TextButton(
                  onPressed: () => Get.to(() => ProductsView()),
                  child: Text(
                    'View All',
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: Colors.green
                    ),
                  ),
                ),
              ],
            ),
            ...products.map((product) => _ProductCard(product: product)),
          ],
        );
      }),
    );
  }
}

class _ProductCard extends StatelessWidget {

  final ProductModel product;
  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return SizedBox(
      height: size.height * 0.15,
      child: GestureDetector(
        onTap: () {
          Get.to(() => ProductsView());
        },
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  product.picture,
                  width: size.width * 0.2,
                  height: size.width * 0.2,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: size.width * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      product.title,
                      style: theme.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      product.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }

}