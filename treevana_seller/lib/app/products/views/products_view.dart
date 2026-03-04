import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treevana_seller/app/products/controllers/product_controller.dart';
import 'package:treevana_seller/core/constants.dart';
import '../controllers/products_controller.dart';
import '../../products/views/product_view.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final productsCtrl = Get.find<ProductsController>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Products', style: theme.textTheme.titleLarge?.copyWith(color: Colors.white)),
      ),
      body:
        //final products = controller.products;
        //if (controller.isLoading.value) {
        //  return const Center(child: CircularProgressIndicator());
        //}
        MyConstants.products.isEmpty ?
          Center(
            child: Text('No products available right now 🌱',
                style: theme.textTheme.bodyLarge)) :
        ListView.builder(
          padding: EdgeInsets.all(size.width * 0.04),
          itemCount: productsCtrl.products.length,
          itemBuilder: (context, index) {
            final product = productsCtrl.products[index];
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
          },
        ),
    );
  }

}