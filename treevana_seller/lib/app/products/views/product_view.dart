import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treevana_seller/app/products/models/product_model.dart';
import 'package:treevana_seller/app/orders/views/order_view.dart';
import 'package:treevana_seller/core/constants.dart';
import '../../orders/controllers/orders_controller.dart';
import 'package:treevana_seller/app/auth/models/user_model.dart';

class ProductView extends StatelessWidget {

  final ProductModel product;
  const ProductView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final ordersController = Get.find<OrdersController>();
    final user = UserModel(
      id: 'u0',
      name: 'Demo User',
      email: 'demo@treevana.com',
      password: '',
      phone: '+213 555 123 456',
      avatar: 'https://cdn-icons-png.flaticon.com/512/219/219970.png',
    );
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
              child: Image.asset(
                product.picture,
                width: size.width,
                height: size.height * 0.3,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              product.title,
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              product.description,
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 5),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
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
                      product.seller.name,
                      style: theme.textTheme.bodyLarge,
                    ),
                    Text(
                      "Email: ${product.seller.email}",
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      "Phone: ${product.seller.phoneNumber}",
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: size.height * 0.08),
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: MyConstants.primaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                onPressed: () => Get.to(() => OrderView(productName: product.title)),
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                  size: 30,
                ),
                label: Text(
                  'Request Order',
                  style: theme.textTheme.titleMedium?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}