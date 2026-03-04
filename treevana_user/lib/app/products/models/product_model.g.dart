// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  id: json['id'] as String? ?? '',
  title: json['title'] as String,
  description: json['description'] as String,
  quantity: (json['quantity'] as num).toInt(),
  price: (json['price'] as num).toDouble(),
  picture: json['picture'] as String,
  seller: SellerModel.fromJson(json['seller'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'quantity': instance.quantity,
      'price': instance.price,
      'picture': instance.picture,
      'seller': instance.seller.toJson(),
    };
