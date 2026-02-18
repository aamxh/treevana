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
  final formKey = GlobalKey<FormState>();

  Future<void> addProduct() async {
    if (formKey.currentState!.validate()) {
      try {
        final model = ProductModel(
          id: "",
          title: title.text.trim(),
          description: description.text.trim(),
          quantity: int.tryParse(quantity.text.trim()) ?? 0,
          price: double.tryParse(price.text.trim()) ?? 0,
          picture: picture.text.trim(),
          seller: MyConstants.seller,
        );
        final res = await ProductsApi.addProduct(model);
        if (res) {
          Get.snackbar("Success", "Product added successfully!");
          Get.back();
        }
      } catch (e) {
        Get.snackbar("Error", e.toString());
      }
    }
  }

}