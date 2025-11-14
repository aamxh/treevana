import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:treevana_user/app/products/models/product_model.dart';
import 'package:treevana_user/core/constants.dart';
import 'package:treevana_user/core/helpers.dart';

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

}