import "package:get/get.dart";
import "package:treevana_user/app/products/models/product_model.dart";
import "package:treevana_user/core/constants.dart";

class ProductController extends GetxController {

  final Rx<ProductModel> product = MyConstants.products[0].obs;

}