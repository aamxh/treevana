import 'package:json_annotation/json_annotation.dart';

part 'seller_model.g.dart';

@JsonSerializable()
class SellerModel {
  final String id;
  final String name;
  final String contact;

  SellerModel({
    required this.id,
    required this.name,
    required this.contact,
  });

  factory SellerModel.fromJson(Map<String, dynamic> json) =>
      _$SellerModelFromJson(json);
  Map<String, dynamic> toJson() => _$SellerModelToJson(this);

}