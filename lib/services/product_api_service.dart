import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/product_model.dart';
import '../models/promo_model.dart';
import '../utils/environment_variables.dart';
import '../utils/api_endpoints.dart';

class ProductApiService {
  //////////////////////////// GET ProductList ////////////////////////////
  Future<List<Product>> fetchProductList() async {
    final productListURL = Uri.parse(ApiUrl.productListURL);
    final response = await http.get(productListURL, headers: <String, String>{
      'Authorization': 'Bearer ' + token,
    });
    debugPrint("productListApiService requestToken: $token \n\n");
    debugPrint(
        "productListApiService responseStatus: ${response.statusCode} \n\n");
    debugPrint(
        "productListApiService responseHeaders: ${response.headers} \n\n");
    debugPrint("productListApiService responseBody: ${response.body} \n\n");

    if (response.statusCode == 200) {
      final _products = (jsonDecode(response.body))['items'] as List;
      debugPrint('productListApiService _products: $_products \n\n');

      List<Product> productList = _products
          .map<Product>((product) => Product.fromJson(product))
          .toList();
      debugPrint('productListApiService productList: $productList \n\n');

      return productList;
    } else {
      throw Exception('Failed to blogs');
    }
  }
}
