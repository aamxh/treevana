import 'package:json_annotation/json_annotation.dart';

part 'client_model.g.dart';

@JsonSerializable()
class ClientModel {

  final String id;
  final String name;
  final String email;
  final String avatar;
  final String phone;

  ClientModel({
    this.id = '',
    required this.name,
    required this.email,
    required this.avatar,
    required this.phone,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) =>
      _$ClientModelFromJson(json);
  Map<String, dynamic> toJson() => _$ClientModelToJson(this);

}