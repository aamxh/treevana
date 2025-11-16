import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treevana_seller/app/products/models/product_model.dart';
import 'package:treevana_seller/app/products/products_api.dart';
import 'package:treevana_seller/core/constants.dart';

class AddProductController extends GetxController {

  final title = TextEditingController();
  final description = TextEditingController();
  final quantity = TextEditingController();
  final price = TextEditingController();
  final picture = TextEditingController();
  final sellerId = TextEditingController();

  Future<void> addProduct() async {
    try {
      final model = ProductModel(
        id: "",
        title: title.text,
        description: description.text,
        quantity: int.tryParse(quantity.text) ?? 0,
        price: double.tryParse(price.text) ?? 0,
        picture: picture.text,
        seller: MyConstants.seller,
      );
      await ProductsApi.addProduct(model);
      Get.snackbar("Success", "Product added successfully!");
      Get.back();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

}