import "package:get/get.dart";
import "package:treevana_user/app/orders/models/order_model.dart";
import "package:treevana_user/app/products/models/product_model.dart";
import "package:treevana_user/core/constants.dart";

class OrderController extends GetxController {

  final Rx<OrderModel> order = OrderModel(
    status: OrderStatus.pending,
    product: MyConstants.products.first,
    quantity: 1,
    date: DateTime.now(),
    wilaya: '',
    phone: '',
    name: '',
  ).obs;

  OrderModel copyWith({
    String? phone,
    String? wilaya,
    int? quantity,
    ProductModel? product,
    OrderStatus? status,
    DateTime? date,
  }) {
    return OrderModel(
      phone: phone ?? order.value.phone,
      wilaya: wilaya ?? order.value.wilaya,
      quantity: quantity ?? order.value.quantity,
      product: product ?? order.value.product,
      status: status ?? order.value.status,
      date: date ?? order.value.date,
      name: '',
    );
  }

}