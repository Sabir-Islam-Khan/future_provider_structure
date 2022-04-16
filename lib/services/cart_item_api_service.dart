import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/cart_item_model.dart';
import '../utils/environment_variables.dart';
import '../utils/api_endpoints.dart';

class CartItemApiService {
  //////////////////////////// GET CartItemList ////////////////////////////
  Future<List<CartItem>> fetchCartItemList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? _userId = prefs.getString("userId");

    final cartItemListURL = Uri.parse(ApiUrl.cartItemLink + _userId.toString());
    final response = await http.get(
        cartItemListURL,
        headers: <String, String>{'Authorization': 'Bearer ' + token,
        }
    );
    debugPrint("cartItemListApiService requestToken: $token \n\n");
    debugPrint(
        "cartItemListApiService responseStatus: ${response.statusCode} \n\n");
    debugPrint(
        "cartItemListApiService responseHeaders: ${response.headers} \n\n");
    debugPrint("cartItemListApiService responseBody: ${response.body} \n\n");

    if (response.statusCode == 200) {
      final _cartItems = (jsonDecode(response.body))['items'] as List;
      debugPrint('cartItemListApiService _cartItems: $_cartItems \n\n');

      List<CartItem> cartItemList = _cartItems.map<CartItem>((cartItem) =>
          CartItem.fromJson(cartItem)).toList();
      debugPrint('cartItemListApiService cartItemList: $cartItemList \n\n');

      return cartItemList;
    } else {
      throw Exception('Failed to blogs');
    }
  }
}