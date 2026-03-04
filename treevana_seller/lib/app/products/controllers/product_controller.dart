import "package:get/get.dart";
import "package:treevana_seller/app/products/models/product_model.dart";
import "package:treevana_seller/core/constants.dart";

class ProductController extends GetxController {

  final Rx<ProductModel> product = MyConstants.products[0].obs;

}