import 'package:json_annotation/json_annotation.dart';

part 'seller_model.g.dart';

@JsonSerializable()
class SellerModel {

  final String id;
  final String name;
  final String email;
  final String picture;
  final String phoneNumber;

  SellerModel({
    required this.id,
    required this.name,
    required this.email,
    required this.picture,
    required this.phoneNumber,
  });

  factory SellerModel.fromJson(Map<String, dynamic> json) =>
      _$SellerModelFromJson(json);
  Map<String, dynamic> toJson() => _$SellerModelToJson(this);

}