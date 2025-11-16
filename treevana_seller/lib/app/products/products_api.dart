import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:treevana_seller/app/products/models/product_model.dart';
import 'package:treevana_seller/core/constants.dart';
import 'package:treevana_seller/core/helpers.dart';

class ProductsApi {

  static final dio = Dio();

  static Future<List<ProductModel>> getAllProducts() async {
    try {
      final res = await dio.get("${MyConstants.baseUrl}api/products/all");
      if (MyHelpers.isResOk(res.statusCode!)) {
        final data = jsonDecode(res.data);
        return data.map((item) => ProductModel.fromJson(item)).toList();
      }
      return [];
    } catch(ex) {
      print(ex);
      return [];
    }
  }

  static Future<void> addProduct(ProductModel product) async {
    try {
      final res = await dio.post("${MyConstants.baseUrl}api/products/create");
      if (MyHelpers.isResOk(res.statusCode!)) {

      }
    } catch(ex) {
      print(ex);
    }
  }

}