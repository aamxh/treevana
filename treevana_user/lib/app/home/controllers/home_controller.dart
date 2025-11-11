import 'package:get/get.dart';
import 'package:treevana_user/app/common/models/product_model.dart';
import 'package:treevana_user/app/common/models/seller_model.dart';

class HomeController extends GetxController {

  final products = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadProducts();
  }

  void _loadProducts() {
    final demoSeller = SellerModel(
      id: 's1',
      name: 'GreenLife Nursery',
      email: 'greenlife@example.com',
      phoneNumber: '0655173633',
      picture: ''
    );
    products.assignAll([
      ProductModel(
        id: 'p1',
        title: 'Oak Sapling',
        description: 'A hardy young oak, perfect for temperate climates.',
        quantity: 12,
        price: 14.99,
        picture:
        'assets/oak_sapling.jpeg',
        seller: demoSeller,
      ),
      ProductModel(
        id: 'p2',
        title: 'Maple Sapling',
        description: 'Beautiful red maple tree for your garden.',
        quantity: 8,
        price: 19.50,
        picture:
        'assets/maple_sapling.jpg',
        seller: demoSeller,
      ),
    ]);
  }

}