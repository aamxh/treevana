import 'package:flutter/material.dart';
import 'package:treevana_seller/app/products/models/product_model.dart';
import 'package:treevana_seller/app/common/models/seller_model.dart';
import 'package:treevana_seller/app/orders/models/order_model.dart';

class MyConstants {

  MyConstants._();

  static final grey = Colors.grey;
  static final lightGrey = Colors.grey[100];
  static final darkGrey = Colors.grey[900];
  static final errorColor = Color(0xffb02727);
  static final primaryColor = Color(0xff4b6335);
  static final baseUrl = 'http://10.0.2.2:8000/';

  static final List<OrderModel> orders = [
    OrderModel(
      id: 'o1',
      product: products[0],
      quantity: 1,
      status: OrderStatus.pending,
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
    OrderModel(
      id: 'o2',
      product: products[1],
      quantity: 2,
      status: OrderStatus.accepted,
      date: DateTime.now().subtract(const Duration(days: 3)),
    ),
    OrderModel(
      id: 'o3',
      product: products[2],
      quantity: 1,
      status: OrderStatus.completed,
      date: DateTime.now().subtract(const Duration(days: 7)),
    ),
    OrderModel(
      id: 'o4',
      product: products[3],
      quantity: 1,
      status: OrderStatus.cancelled,
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
  ];

  static final products = <ProductModel>[
    ProductModel(
      id: 'p1',
      title: 'Oak Sapling',
      description: 'A hardy young oak, perfect for temperate climates.',
      quantity: 12,
      price: 14.99,
      picture:
      'assets/oak_sapling.jpeg',
      seller: SellerModel(
        id: 's1',
        name: 'GreenLife Nursery',
        email: 'greenlife@example.com',
        phoneNumber: '0655173633',
        picture: '',
      ),
    ),
    ProductModel(
      id: 'p2',
      title: 'Maple Sapling',
      description: 'Beautiful red maple tree for your garden.',
      quantity: 8,
      price: 19.50,
      picture:
      'assets/maple_sapling.jpg',
      seller: SellerModel(
        id: 's1',
        name: 'GreenLife Nursery',
        email: 'greenlife@example.com',
        phoneNumber: '0655173633',
        picture: '',
      ),
    ),
    ProductModel(
      id: 'p3',
      title: 'Fiddle Leaf Fig',
      description: 'Large indoor plant with broad glossy leaves. Great for interiors.',
      quantity: 15,
      price: 39.00,
      picture: 'assets/fiddle_leaf_fig.jpg',
      seller: SellerModel(
        id: 's3',
        name: 'Leafy Loft',
        email: 'sales@leafyloft.com',
        phoneNumber: '+44 7700 900321',
        picture: '',
      ),
    ),
    ProductModel(
      id: 'p1',
      title: 'Oak Sapling',
      description: 'A hardy young oak, perfect for temperate climates.',
      quantity: 12,
      price: 14.99,
      picture:
      'assets/oak_sapling.jpeg',
      seller: SellerModel(
        id: 's1',
        name: 'GreenLife Nursery',
        email: 'greenlife@example.com',
        phoneNumber: '0655173633',
        picture: '',
      ),
    ),
  ];

}