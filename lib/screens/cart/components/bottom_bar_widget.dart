import 'package:flutter/material.dart';

import '../../../utils/themes.dart';

Widget bottomBarWidget(int total) {
  return Container(
    height: ScreenSize.height * 0.08,
    width: ScreenSize.width * 1,
    color: globalColor_13DarkBlue,
    child: Center(
      child: Row(
        children: [
          const SizedBox(
            width: 20.0,
          ),
          const Text(
            "Total",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Text(
            "${total / 100}\$",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          GestureDetector(
            //////////// TODO :   Add delivery address ////////////
            onTap: () async {
              //CartApiService().addToCart(productId, quantity);
            },
            child: Container(
              height: ScreenSize.height * 0.05,
              width: ScreenSize.width * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.blue,
              ),
              child: const Center(
                child: Text(
                  "CHECKOUT",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
        ],
      ),
    ),
  );
}