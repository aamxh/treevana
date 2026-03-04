import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treevana_user/app/orders/controllers/order_controller.dart';
import 'package:treevana_user/app/orders/models/order_model.dart';
import 'package:treevana_user/app/products/controllers/product_controller.dart';
import 'package:treevana_user/app/orders/views/order_view.dart';
import 'package:treevana_user/core/constants.dart';
import 'package:treevana_user/app/common/models/user_model.dart';

class ProductView extends StatelessWidget {

  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final orderCtrl = Get.find<OrderController>();
    final productCtrl = Get.find<ProductController>();
    final user = UserModel(
      name: 'Demo User',
      email: 'demo@treevana.com',
      password: '',
      phone: '+213 555 123 456',
      //avatar: 'https://cdn-icons-png.flaticon.com/512/219/219970.png',
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
                orderCtrl.order.value.product.picture,
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
                      productCtrl.product.value.seller.name,
                      style: theme.textTheme.bodyLarge,
                    ),
                    Text(
                      "Email: ${productCtrl.product.value.seller.email}",
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      "Phone: ${productCtrl.product.value.seller.phone}",
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
                onPressed: () {
                  Get.find<OrderController>().order.value = OrderModel(
                      product: productCtrl.product.value,
                      quantity: 1,
                      status: OrderStatus.pending,
                      date: DateTime.now(),
                      wilaya: '',
                      phone: '',
                    name: '',
                  );
                  Get.to(() => OrderView());
                },
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