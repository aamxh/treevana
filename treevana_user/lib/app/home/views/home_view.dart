import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treevana_user/app/orders/views/orders_view.dart';
import 'package:treevana_user/app/products/views/product_view.dart';
import 'package:treevana_user/app/products/views/products_view.dart';
import 'package:treevana_user/app/settings/views/settings_view.dart';
import 'package:treevana_user/app/products/views/products_view.dart';
import 'package:treevana_user/core/constants.dart';
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
          style: theme.textTheme.headlineSmall!.copyWith(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.to(() => OrdersView()),
          icon: const Icon(
            Icons.shopping_bag_outlined,
            size: 30,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.view_headline_outlined,
              size: 30,
            ),
            onPressed: () => Get.to(() => SettingsView()),
          ),
        ],
      ),
      body: MyConstants.products.isEmpty ?
        Center(
            child: Text('No products available right now 🌱'),
          ) :
        ListView(
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
                      color: MyConstants.primaryColor
                    ),
                  ),
                ),
              ],
            ),
            ...MyConstants.products.map((product) => _ProductCard(product: product)),
          ],
        ),
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
    return GestureDetector(
        onTap: () {
          Get.to(() => ProductView(product: product,));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 3,
          margin: EdgeInsets.only(bottom: size.height * 0.02),
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.03),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    product.picture,
                    width: size.width * 0.25,
                    height: size.width * 0.25,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: size.width * 0.04),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.title,
                          style: theme.textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      SizedBox(height: size.height * 0.005),
                      Text(product.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyMedium),
                      SizedBox(height: size.height * 0.005),
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: MyConstants.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }

}