import 'package:flutter/material.dart';

class ProductQuantityProvider extends ChangeNotifier {
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
}
