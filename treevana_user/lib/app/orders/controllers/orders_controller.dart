import 'package:get/get.dart';
import '../models/order_model.dart';

class OrdersController extends GetxController {

  final orders = <OrderModel>[].obs;

  void addOrder(OrderModel order) {
    orders.add(order);
  }

  void updateStatus(String id, OrderStatus status) {
    final index = orders.indexWhere((o) => o.id == id);
    if (index != -1) {
      orders[index] = OrderModel(
        id: orders[index].id,
        product: orders[index].product,
        buyer: orders[index].buyer,
        quantity: orders[index].quantity,
        status: status,
        date: orders[index].date,
      );
    }
  }

}