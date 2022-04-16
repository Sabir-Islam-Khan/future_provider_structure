import 'dart:collection';
import 'package:flutter/material.dart';

import '../../models/cart_model.dart';
import '../../models/cart_item_model.dart';
import '../cart_api_service.dart';

class CartProvider extends ChangeNotifier {

  late Cart _cart = Cart(
    userId: 0,
    cartId: 0,
    cartItemsCount: 0,
    cartItemSubtotal: 0,
    deliverySubtotal: 0,
    taxSubtotal: 0,
    grandTotal: 0,
    links: CartLinks(
      selfLink: '',
      owner: '',
    ),
  );

  Cart get cart => _cart;
  /////////////////////////////// GET Cart Items //////////////////////////////
  getCart() {
    CartApiService().fetchCart();
    notifyListeners();
  }

  late CartItem _cartItem = CartItem(
    cartItemId: 0,
    productId: 0,
    supplierId: 0,
    supplierName: '',
    cartId: 0,
    transactionId: 0,
    taxId: 0,
    orderId: 0,
    orderReceivedId: 0,
    receiptId: 0,
    brand: '',
    model: '',
    currency: '',
    amount: 0,
    discount: 0,
    quantity: 0,
    ttlAmount: 0,
    featurePicture: '',
  );

  late List<CartItem> _cartItemList = [];
  UnmodifiableListView<CartItem> get cartItemList => UnmodifiableListView(_cartItemList);


  int productCount = 1;

  void increaseCount() {
    productCount += 1;
    notifyListeners();
  }

  void decreaseCount() {
    productCount -= 1;
    notifyListeners();
  }

  void resetCount() {
    productCount = 1;
    notifyListeners();
  }

  get getProductCount {
    return productCount;
  }

  void addToCart(int productId) {

  }
}