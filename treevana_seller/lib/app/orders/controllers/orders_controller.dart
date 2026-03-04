import 'package:get/get.dart';
import 'package:treevana_seller/core/constants.dart';
import '../models/order_model.dart';

class OrdersController extends GetxController {

  final orders = MyConstants.orders.obs;

  void addOrder(OrderModel order) {
    orders.add(order);
  }

  void updateStatus(int idx, OrderStatus status) {
    if (idx >= 0) {
      orders[idx] = OrderModel(
        product: orders[idx].product,
        quantity: orders[idx].quantity,
        status: status,
        date: orders[idx].date,
        name: '',
        phone: '',
        wilaya: ''
      );
    }
  }

}