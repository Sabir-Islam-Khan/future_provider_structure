import 'package:flutter/material.dart';

import '../../../services/cart_api_service.dart';
import '../../../services/providers/cart_provider.dart';
import '../../../utils/themes.dart';

Widget bottomNavWidget(product) {
  int productId = product.productId;
  int quantity = 5;

  return Container(
    height: ScreenSize.height * 0.08,
    width: ScreenSize.width * 1,
    color: globalColor_13DarkBlue,
    child: Center(
      child: Row(
        children: [
          SizedBox(
            width: ScreenSize.width * 0.57,
          ),
          addToCart(productId, quantity),
        ],
      ),
    ),
  );
}

Widget addToCart(productId, quantity) {
  return GestureDetector(
    //////////// TODO :   Add delivery address ////////////
    onTap: () async {
      //CartProvider().addToCart(productId);
      CartApiService().addProductToCart(productId, quantity);
    },
    child: Container(
      height: ScreenSize.height * 0.05,
      width: ScreenSize.width * 0.37,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.blue,
      ),
      child: const Center(
        child: Text(
          "ADD TO CART",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}