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

  static Future<bool> addProduct(ProductModel product) async {
    try {
      final json = jsonEncode(product.toJson());
      final res = await dio.post("${MyConstants.baseUrl}api/products/create", data: json);
      if (MyHelpers.isResOk(res.statusCode!)) return true;
      return false;
    } catch(ex) {
      print(ex);
      return false;
    }
  }

}