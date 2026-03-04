import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treevana_seller/app/common/controllers/user_controller.dart';
import 'package:treevana_seller/app/home/views/home_view.dart';
import 'package:treevana_seller/app/products/controllers/add_product_controller.dart';
import 'package:treevana_seller/app/products/controllers/product_controller.dart';
import 'package:treevana_seller/app/products/controllers/products_controller.dart';
import 'package:treevana_seller/app/products/models/product_model.dart';
import 'package:treevana_seller/app/orders/views/order_view.dart';
import 'package:treevana_seller/core/constants.dart';
import '../../orders/controllers/orders_controller.dart';
import 'package:treevana_seller/app/common/models/user_model.dart';

class ProductView extends StatelessWidget {

  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final productCtrl = Get.find<ProductController>();
    final userCtrl = Get.find<UserController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details', style: theme.textTheme.headlineSmall!.copyWith(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: productCtrl.product.value.picture.isEmpty ?
              Image.network(
                "https://images.unsplash.com/photo-1542601906990-b4d3fb778b09?w=800&fit=crop",
              ) :
              Image.asset(
                productCtrl.product.value.picture,
                width: size.width,
                height: size.height * 0.3,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              productCtrl.product.value.title,
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              productCtrl.product.value.description,
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 5),
            Text(
              '\$${productCtrl.product.value.price.toStringAsFixed(2)}',
              style: theme.textTheme.titleMedium?.copyWith(
                color: MyConstants.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 24),
            Text('Seller', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
            Row(
              children: [
                CircleAvatar(
                  minRadius: 30,
                  backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/219/219970.png'),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userCtrl.user.value.name,
                      style: theme.textTheme.bodyLarge,
                    ),
                    Text(
                      "Email: ${userCtrl.user.value.email}",
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      "Phone: ${userCtrl.user.value.phone}",
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: size.height * 0.04),
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: MyConstants.primaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  fixedSize: Size(size.width * 0.6, size.height * 0.064),
                ),
                icon: Icon(
                  Icons.edit,
                  size: 30,
                ),
                onPressed: () {},
                label: Text(
                  'Edit Product',
                  style: theme.textTheme.titleMedium?.copyWith(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02,),
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: theme.scaffoldBackgroundColor,
                  foregroundColor: theme.colorScheme.secondary,
                  fixedSize: Size(size.width * 0.6, size.height * 0.064),
                  side: BorderSide(color: MyConstants.errorColor, width: 2),
                ),
                icon: Icon(
                  Icons.delete_outline,
                  size: 30,
                  color: MyConstants.errorColor,
                ),
                onPressed: () => Get.dialog(
                  AlertDialog(
                    title: Text(
                      'Delete Product',
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    content: Text(
                      'Are you sure you want to delete "${productCtrl.product.value.title}"? This action cannot be undone.',
                      style: theme.textTheme.bodyMedium,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Get.back(),
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: theme.colorScheme.secondary),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyConstants.errorColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: () {
                          final productsCtrl = Get.find<ProductsController>();
                          productsCtrl.products.removeWhere(
                                (p) => p.id == productCtrl.product.value.id,
                          );
                          Get.to(() => HomeView());
                        },
                        child: const Text('Delete'),
                      ),
                    ],
                  ),
                  ),
                label: Text(
                  'Delete Product',
                  style: theme.textTheme.titleMedium?.copyWith(color: MyConstants.errorColor),
                ),
              ),
            ),          ],
        ),
      ),
    );
  }

}