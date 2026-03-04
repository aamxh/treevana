import 'package:flutter/material.dart';
import 'package:treevana_seller/app/common/models/user_model.dart';
import 'package:treevana_seller/app/products/models/product_model.dart';
import 'package:treevana_seller/app/common/models/client_model.dart';
import 'package:treevana_seller/app/orders/models/order_model.dart';

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
      name: 'Fratsa Islam Yacine',
      phone: '0655163533',
      wilaya: 'Bejaia',
      status: OrderStatus.pending,
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
    OrderModel(
      name: 'Fratsa Islam Yacine',
      phone: '0655163533',
      wilaya: 'Bejaia',
      product: products[1],
      quantity: 2,
      status: OrderStatus.accepted,
      date: DateTime.now().subtract(const Duration(days: 3)),
    ),
    OrderModel(
      name: 'Fratsa Islam Yacine',
      phone: '0655163533',
      wilaya: 'Bejaia',
      product: products[2],
      quantity: 1,
      status: OrderStatus.completed,
      date: DateTime.now().subtract(const Duration(days: 7)),
    ),
    OrderModel(
      name: 'Fratsa Islam Yacine',
      phone: '0655163533',
      wilaya: 'Bejaia',
      product: products[3],
      quantity: 1,
      status: OrderStatus.cancelled,
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
  ];

  static final seller = UserModel(
      name: "Mohammed Alsayed Ahmed",
      password: "test123",
      email: "a.a.mxhamed@gmail.com",
      phone: "0655163532"
  );

  static final client = ClientModel(
    name: "Hakmi Zohir",
    email: "z_hakmi@estin.dz",
    phone: "0655163533",
    avatar: ""
  );

  static final products = <ProductModel>[
    ProductModel(
      id: "p1",
      title: 'Oak Sapling',
      description: 'A hardy young oak, perfect for temperate climates.',
      quantity: 12,
      price: 14.99,
      picture:
      'assets/oak_sapling.jpeg',
    ),
    ProductModel(
      id: "p2",
      title: 'Maple Sapling',
      description: 'Beautiful red maple tree for your garden.',
      quantity: 8,
      price: 19.50,
      picture:
      'assets/maple_sapling.jpg',
    ),
    ProductModel(
      id: "p3",
      title: 'Fiddle Leaf Fig',
      description: 'Large indoor plant with broad glossy leaves. Great for interiors.',
      quantity: 15,
      price: 39.00,
      picture: 'assets/fiddle_leaf_fig.jpg',
    ),
    ProductModel(
      id: "p4",
      title: 'Oak Sapling',
      description: 'A hardy young oak, perfect for temperate climates.',
      quantity: 12,
      price: 14.99,
      picture:
      'assets/oak_sapling.jpeg',
    ),
  ];

}