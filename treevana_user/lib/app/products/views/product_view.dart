import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treevana_user/app/common/models/product_model.dart';
import '../../orders/controllers/orders_controller.dart';
import 'package:treevana_user/app/common/models/user_model.dart';
import 'package:treevana_user/app/orders/models/order_model.dart';
import 'package:uuid/uuid.dart';

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
      phoneNumber: '+213 555 123 456',
      picture: 'https://cdn-icons-png.flaticon.com/512/219/219970.png',
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Tree Details', style: theme.textTheme.headlineSmall!.copyWith(color: Colors.white)),
        backgroundColor: Colors.green,
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
              '\$${product.price.toStringAsFixed(2)}',
              style: theme.textTheme.titleMedium?.copyWith(color: Colors.green, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 5),
            Text(
              product.description,
              style: theme.textTheme.bodyMedium,
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
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  final order = OrderModel(
                    id: const Uuid().v4(),
                    product: product,
                    buyer: user,
                    quantity: 1,
                    status: OrderStatus.pending,
                    date: DateTime.now(),
                  );
                  ordersController.addOrder(order);
                  Get.snackbar(
                    'Order Added',
                    'Your request for ${product.title} was sent to the seller.',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.green.shade50,
                    colorText: Colors.green.shade900,
                  );
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