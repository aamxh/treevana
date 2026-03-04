import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treevana_seller/app/orders/views/orders_view.dart';
import 'package:treevana_seller/app/products/controllers/add_product_controller.dart';
import 'package:treevana_seller/app/products/controllers/product_controller.dart';
import 'package:treevana_seller/app/products/controllers/products_controller.dart';
import 'package:treevana_seller/app/products/views/add_product_view.dart';
import 'package:treevana_seller/app/products/views/product_view.dart';
import 'package:treevana_seller/app/products/views/products_view.dart';
import 'package:treevana_seller/app/settings/views/settings_view.dart';
import 'package:treevana_seller/core/constants.dart';
import '../controllers/home_controller.dart';
import 'package:treevana_seller/app/products/models/product_model.dart';

class HomeView extends GetView<HomeController> {

  HomeView({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    Get.put(HomeController());
    final productsCtrl = Get.find<ProductsController>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: const SettingsView(),
      appBar: AppBar(
        title: Text(
          'Treevana',
          style: theme.textTheme.headlineSmall!.copyWith(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.view_headline_outlined,
            size: 30,
          ),
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.to(() => OrdersView()),
            icon: const Icon(
              Icons.shopping_bag_outlined,
              size: 30,
            ),
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
                    'My Products',
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
              ...productsCtrl.products.map((product) => _ProductCard(product: product)),
            ],
          ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Get.find<AddProductController>().newProduct.value = true;
          Get.to(() => AddProductView());
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: MyConstants.primaryColor,
          ),
          child: Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
        ),
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
          Get.find<ProductController>().product.value = product;
          Get.to(() => ProductView());
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
                  child: product.picture.isEmpty ?
                  Image.network(
                    "https://images.unsplash.com/photo-1542601906990-b4d3fb778b09?w=800&fit=crop",
                  ) :
                  Image.asset(
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