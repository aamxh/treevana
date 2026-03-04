import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/order_model.dart';
import '../controllers/orders_controller.dart';

class OrdersView extends StatelessWidget {

  const OrdersView({super.key});

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Colors.green.shade600;
      case 'accepted':
        return Colors.orange.shade600;
      default:
        return Colors.grey.shade600;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final controller = Get.find<OrdersController>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Orders', style: theme.textTheme.headlineSmall?.copyWith(color: Colors.white)),
      ),
      body: Obx(() {
        final orders = controller.orders;
        if (orders.isEmpty) {
          return Center(
            child: Text('No orders yet.', style: theme.textTheme.bodyLarge),
          );
        }
        return ListView.builder(
          padding: EdgeInsets.all(size.width * 0.04),
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            final product = order.product;
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              margin: EdgeInsets.only(bottom: size.height * 0.02),
              child: Padding(
                padding: EdgeInsets.all(size.width * 0.03),
                child: Column(
                  children: [
                    Row(
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
                              Text('Quantity: ${order.quantity}',
                                  style: theme.textTheme.bodyMedium),
                              SizedBox(height: size.height * 0.005),
                              Text(
                                order.status.name.toUpperCase(),
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: _statusColor(order.status.toString()),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete_outline,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.01,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                              "Phone: ${product.seller.phone}",
                              style: theme.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }

}