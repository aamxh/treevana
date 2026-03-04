import 'package:flutter/material.dart';
import 'package:treevana_user/app/common/models/user_model.dart';
import 'package:treevana_user/app/products/models/product_model.dart';
import 'package:treevana_user/app/common/models/seller_model.dart';
import 'package:treevana_user/app/orders/models/order_model.dart';

class MyConstants {

  MyConstants._();

  static final grey = Colors.grey;
  static final lightGrey = Colors.grey[100];
  static final darkGrey = Colors.grey[900];
  static final errorColor = Color(0xffb02727);
  static final primaryColor = Color(0xff4b6335);
  static final baseUrl = 'https://treevana.onrender.com/';

  static final List<OrderModel> orders = [
    OrderModel(
      product: products[0],
      quantity: 1,
      status: OrderStatus.pending,
      date: DateTime.now().subtract(const Duration(days: 1)),
      wilaya: 'Algiers',
      phone: "0655163532",
      name: 'Mohammed Alsayed Ahmed',
    ),
    OrderModel(
      product: products[1],
      quantity: 2,
      status: OrderStatus.accepted,
      date: DateTime.now().subtract(const Duration(days: 3)),
      wilaya: 'Algiers',
      phone: "0655163532",
      name: 'Mohammed Alsayed Ahmed',
    ),
    OrderModel(
      product: products[2],
      quantity: 1,
      status: OrderStatus.completed,
      date: DateTime.now().subtract(const Duration(days: 7)),
      wilaya: 'Algiers',
      phone: "0655163532",
      name: 'Mohammed Alsayed Ahmed',
    ),
    OrderModel(
      product: products[3],
      quantity: 1,
      status: OrderStatus.cancelled,
      date: DateTime.now().subtract(const Duration(days: 2)),
      wilaya: 'Algiers',
      phone: "0655163532",
      name: 'Mohammed Alsayed Ahmed',
    ),
  ];

  static final client = UserModel(
      name: "Hakmi Zohir",
      email: "z_hakmi@estin.dz",
      phone: "0655163533",
      password: "",
  );

  static final seller = SellerModel(
    name: "Mohammed Alsayed Ahmed",
    email: "a.a.mxhamed@gmail.com",
    phone: "0655163532",
    avatar: '',
  );

  static final products = <ProductModel>[
    ProductModel(
      title: 'Oak Sapling',
      description: 'A hardy young oak, perfect for temperate climates.',
      quantity: 12,
      price: 14.99,
      picture:
      'assets/oak_sapling.jpeg',
      seller: seller,
    ),
    ProductModel(
      title: 'Maple Sapling',
      description: 'Beautiful red maple tree for your garden.',
      quantity: 8,
      price: 19.50,
      picture:
      'assets/maple_sapling.jpg',
      seller: seller,
    ),
    ProductModel(
      title: 'Fiddle Leaf Fig',
      description: 'Large indoor plant with broad glossy leaves. Great for interiors.',
      quantity: 15,
      price: 39.00,
      picture: 'assets/fiddle_leaf_fig.jpg',
      seller: seller,
    ),
    ProductModel(
      title: 'Oak Sapling',
      description: 'A hardy young oak, perfect for temperate climates.',
      quantity: 12,
      price: 14.99,
      picture:
      'assets/oak_sapling.jpeg',
      seller: seller,
      ),
  ];

}