import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jaaba/models/suppliers_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/cart_model.dart';
import '../models/cart_item_model.dart';
import '../utils/environment_variables.dart';
import '../utils/api_endpoints.dart';

class CartApiService {
  //////////////////////////////// GET Cart ////////////////////////////////
  Future<Cart> fetchCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? _userId = prefs.getString('userId');

    final cartURL = Uri.parse(ApiUrl.cartLink + _userId.toString());
    final response = await http.get(
      cartURL,
      headers: <String, String>{
        'Authorization': 'Bearer ' + token,
      },
    );
    debugPrint('CartApiService fetchCart() requestToken: $token} \n\n');
    debugPrint(
        'CartApiService fetchCart() responseStatus: ${response.statusCode} \n\n');
    debugPrint(
        'CartApiService fetchCart() responseHeaders: ${response.headers} \n\n');
    debugPrint(
        'CartApiService fetchCart() responseBody: ${response.body} \n\n');

    if (response.statusCode == 200) {
      Cart cart = Cart.fromJson(jsonDecode(response.body));
      debugPrint('CartApiService fetchCart() cart: $cart \n\n');

      return cart;
    } else {
      throw Exception('CartApiService fetchCart() GET request failed: '
          'Error: ${response.statusCode} \n \n');
    }
  }

  /////////////////////////// GET cartItemList ///////////////////////////
  Future<List<CartItem>> fetchCartItemList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? _userId = prefs.getString("userId");

    final cartItemURL = Uri.parse(ApiUrl.cartItemLink + _userId.toString());
    final response = await http.get(
      cartItemURL,
      headers: <String, String>{
        'Authorization': 'Bearer ' + token,
      },
    );
    debugPrint(
        'CartItemListApiService fetchCartItemList() requestToken: $token} \n\n');
    debugPrint(
        'CartItemListApiService fetchCartItemList() responseStatus: ${response.statusCode} \n\n');
    debugPrint(
        'CartItemListApiService fetchCartItemList() responseHeaders: ${response.headers} \n\n');
    debugPrint(
        'CartItemListApiService fetchCartItemList() responseBody: ${response.body} \n\n');

    if (response.statusCode == 200) {
      final _cartItems = await (jsonDecode(response.body))['items'] as List;
      debugPrint(
          'CartItemListApiService fetchCartItemList() _cartItems: $_cartItems \n\n');

      List<CartItem> cartItemList =
          _cartItems.map<CartItem>((item) => CartItem.fromJson(item)).toList();
      debugPrint(
          'CartItemListApiService fetchCartItemList() cartItemList: $cartItemList \n\n');

      return cartItemList;
    } else {
      throw Exception(
          'CartItemListApiService fetchCartItemList() GET request failed: '
          'Error ${response.statusCode} \n \n');
    }
  }

  /////////////////// fetch cart item supplers ////////////////////
  ///
  Future<List<Supplier>> fetchSuppliers() async {
    var suppliersUrl = Uri.parse(
      ApiUrl.cartSupplierLink + userId.toString(),
    );

    var response = await http.get(
      suppliersUrl,
      headers: <String, String>{
        'Authorization': 'Bearer ' + token,
      },
    );

    if (response.statusCode == 200) {
      final _items = await (jsonDecode(response.body))['items'] as List;
      List<Supplier> _suppliers =
          _items.map<Supplier>((item) => Supplier.fromJson(item)).toList();
      debugPrint("Success in fetching suppliers");

      return _suppliers;
    } else {
      throw Exception(
          "Error in fetching suppliers  error code ${response.statusCode}\n");
    }
  }

  ////////////////////////////// PUT addProductToCart //////////////////////////////
  Future<void> addProductToCart(int productId, int quantity) async {
    final productAddItemURL =
        Uri.parse(ApiUrl.addProductToCartLink + productId.toString());

    final response = await http.put(
      productAddItemURL,
      headers: <String, String>{
        'Authorization': 'Bearer ' + token,
      },
      body: json.encode({
        'product_id': productId,
        'quantity': quantity,
      }),
    );
    debugPrint(
        'CartItemListApiService addProductToCart() responseStatus: ${response.statusCode} \n\n');
    debugPrint(
        'CartItemListApiService addProductToCart() responseHeaders: ${response.headers} \n\n');
    debugPrint(
        'CartItemListApiService addProductToCart() responseBody: ${response.body} \n\n');

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      debugPrint(
          'CartItemListApiService addProductToCart() PUT request jsonData: $jsonData \n\n');
      debugPrint(
          "CartItemListApiService addProductToCart() jsonDataProductId: ${jsonData['productId']} \n\n");
      debugPrint(
          "CartItemListApiService addProductToCart() jsonDataProductId: ${jsonData['token']} \n\n");

      return jsonData;
    } else {
      debugPrint(
          'CartItemListApiService addProductToCart() PUT request failed: '
          'Error ${response.statusCode} \n \n');
    }
  }

  /////////////////////// PUT incrementCartItemQtyLink ///////////////////////
  Future<void> incrementCartItemQty(int cartItemId) async {
    final itemLink =
        Uri.parse(ApiUrl.incrementCartItemQtyLink + cartItemId.toString());

    var response = await http.put(
      itemLink,
      headers: <String, String>{
        'Authorization': 'Bearer ' + token,
      },
    );
    if (response.statusCode == 200) {
      debugPrint('Added amount');
    } else {
      debugPrint(
          'CartItemListApiService fetchCartItemList() GET request failed: '
          'Error ${response.statusCode} \n \n');
    }
  }

  ///////////////////////// PUT subtractItemFromCart /////////////////////////
  Future<void> decrementCartItemQty(int cartItemId) async {
    final itemLink =
        Uri.parse(ApiUrl.decrementCartItemQtyLink + cartItemId.toString());

    var response = await http.put(
      itemLink,
      headers: <String, String>{
        'Authorization': 'Bearer ' + token,
      },
    );
    if (response.statusCode == 200) {
      debugPrint('Subtracted amount');
    } else {
      debugPrint(
          'CartItemListApiService fetchCartItemList() GET request failed: '
          'Error ${response.statusCode} \n \n');
    }
  }
}
