import 'package:get/get.dart';
import 'package:treevana_seller/app/products/models/product_model.dart';
import 'package:treevana_seller/app/products/products_api.dart';

class ProductsController extends GetxController {

  final RxList<ProductModel> products = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    try {
      products.value = await ProductsApi.getAllProducts();
    } catch (ex) {
      print("Failed to load products: $ex");
    }
  }

}