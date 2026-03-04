import 'package:json_annotation/json_annotation.dart';
import '../../common/models/client_model.dart';

part 'product_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductModel {

  final String id;
  final String title;
  final String description;
  final int quantity;
  final double price;
  final String picture;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.quantity,
    required this.price,
    required this.picture,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

}