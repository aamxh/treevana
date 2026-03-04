// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
  id: json['id'] as String? ?? '',
  product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
  quantity: (json['quantity'] as num).toInt(),
  status: $enumDecode(_$OrderStatusEnumMap, json['status']),
  date: DateTime.parse(json['date'] as String),
  wilaya: json['wilaya'] as String,
  phone: json['phone'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product.toJson(),
      'quantity': instance.quantity,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'date': instance.date.toIso8601String(),
      'wilaya': instance.wilaya,
      'phone': instance.phone,
      'name': instance.name,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.pending: 'pending',
  OrderStatus.accepted: 'accepted',
  OrderStatus.completed: 'completed',
  OrderStatus.cancelled: 'cancelled',
};
