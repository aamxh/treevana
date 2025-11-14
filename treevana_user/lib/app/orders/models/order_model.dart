import 'package:json_annotation/json_annotation.dart';
import 'package:treevana_user/app/common/models/seller_model.dart';
import '../../products/models/product_model.dart';

part 'order_model.g.dart';

enum OrderStatus { pending, accepted, completed, cancelled }

@JsonSerializable(explicitToJson: true)
class OrderModel {

  final String id;
  final ProductModel product;
  final int quantity;
  final OrderStatus status;
  final DateTime date;

  OrderModel({
    required this.id,
    required this.product,
    required this.quantity,
    required this.status,
    required this.date,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

}