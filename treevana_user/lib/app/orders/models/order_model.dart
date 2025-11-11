import 'package:json_annotation/json_annotation.dart';
import '../../common/models/product_model.dart';
import '../../common/models/user_model.dart';

part 'order_model.g.dart';

enum OrderStatus { pending, accepted, completed, cancelled }

@JsonSerializable(explicitToJson: true)
class OrderModel {

  final String id;
  final ProductModel product;
  final UserModel buyer;
  final int quantity;
  final OrderStatus status;
  final DateTime date;

  OrderModel({
    required this.id,
    required this.product,
    required this.buyer,
    required this.quantity,
    required this.status,
    required this.date,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

}