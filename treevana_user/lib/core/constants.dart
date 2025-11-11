import 'package:flutter/material.dart';
import 'package:treevana_user/app/common/models/product_model.dart';
import 'package:treevana_user/app/common/models/seller_model.dart';
import 'package:treevana_user/app/orders/models/order_model.dart';

class MyConstants {

  MyConstants._();

  static final grey = Colors.grey;
  static final lightGrey = Colors.grey[100];
  static final darkGrey = Colors.grey[900];
  static final errorColor = Color(0xffb02727);
  static final primaryColor = Color(0xff80a651);
  static final baseUrl = 'http://10.0.2.2:8000/';

  static final List<OrderModel> orders = [
    OrderModel(
      id: 'o1',
      product: ProductModel(
        id: 'p1',
        title: 'Japanese Maple',
        description: 'A beautiful ornamental tree with deep red leaves, ideal for gardens.',
        quantity: 10,
        price: 29.99,
        picture: 'https://example.com/images/japanese_maple.jpg',
        seller: SellerModel(
          id: 's1',
          name: 'Aiko’s Garden',
          email: 'aiko@garden.jp',
          phoneNumber: '+81 90 1234 5678',
          picture: 'https://example.com/images/seller_aiko.jpg',
        ),
      ),
      quantity: 1,
      status: OrderStatus.pending,
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
    OrderModel(
      id: 'o2',
      product: ProductModel(
        id: 'p2',
        title: 'Olive Tree',
        description: 'Mediterranean olive tree that thrives in full sun and dry soil.',
        quantity: 25,
        price: 49.50,
        picture: 'https://example.com/images/olive_tree.jpg',
        seller: SellerModel(
          id: 's2',
          name: 'Green Earth Supplies',
          email: 'contact@greenearth.com',
          phoneNumber: '+1 555-233-1190',
          picture: 'https://example.com/images/seller_greenearth.jpg',
        ),
      ),
      quantity: 2,
      status: OrderStatus.accepted,
      date: DateTime.now().subtract(const Duration(days: 3)),
    ),
    OrderModel(
      id: 'o3',
      product: ProductModel(
        id: 'p3',
        title: 'Fiddle Leaf Fig',
        description: 'Large indoor plant with broad glossy leaves. Great for interiors.',
        quantity: 15,
        price: 39.00,
        picture: 'https://example.com/images/fiddle_leaf_fig.jpg',
        seller: SellerModel(
          id: 's3',
          name: 'Leafy Loft',
          email: 'sales@leafyloft.com',
          phoneNumber: '+44 7700 900321',
          picture: 'https://example.com/images/seller_leafyloft.jpg',
        ),
      ),
      quantity: 1,
      status: OrderStatus.completed,
      date: DateTime.now().subtract(const Duration(days: 7)),
    ),
    OrderModel(
      id: 'o4',
      product: ProductModel(
        id: 'p4',
        title: 'Cedar Bonsai',
        description: 'Miniature cedar tree shaped by experts, representing strength and longevity.',
        quantity: 5,
        price: 79.99,
        picture: 'https://example.com/images/cedar_bonsai.jpg',
        seller: SellerModel(
          id: 's4',
          name: 'Zen Botanicals',
          email: 'info@zenbotanicals.com',
          phoneNumber: '+81 80 5555 1212',
          picture: 'https://example.com/images/seller_zen.jpg',
        ),
      ),
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
  ];

}