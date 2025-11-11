import 'package:get/get.dart';
import 'package:treevana_user/core/constants.dart';
import '../models/order_model.dart';

class OrdersController extends GetxController {

  final orders = MyConstants.orders.obs;

  void addOrder(OrderModel order) {
    orders.add(order);
  }

  void updateStatus(String id, OrderStatus status) {
    final index = orders.indexWhere((o) => o.id == id);
    if (index != -1) {
      orders[index] = OrderModel(
        id: orders[index].id,
        product: orders[index].product,
        quantity: orders[index].quantity,
        status: status,
        date: orders[index].date,
      );
    }
  }

}