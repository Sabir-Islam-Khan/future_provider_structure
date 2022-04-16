import 'package:flutter/material.dart';

import '../../../models/cart_item_model.dart';
import '../../../services/cart_api_service.dart';
import '../../../utils/api_endpoints.dart';
import '../../../utils/themes.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  const CartItemWidget({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String _cartItemFeaturePictureUrl;
    _cartItemFeaturePictureUrl =
        ApiUrl.productPictureLink + cartItem.featurePicture!;
    debugPrint(
        'cart_cartItem_widget _cartItemFeaturePictureUrl: $_cartItemFeaturePictureUrl \n\n');

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          SizedBox(
            height: ScreenSize.height * 0.1,
            width: ScreenSize.width * 0.2,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.network(
                _cartItemFeaturePictureUrl,
              ),
            ),
          ),
          const SizedBox(
            width: 5.0,
          ),
          SizedBox(
            width: ScreenSize.width * 0.46,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20.0,
                  width: ScreenSize.width * 0.4,
                  color: const Color.fromRGBO(152, 157, 199, 1),
                  child: Text(
                    " ${cartItem.supplierName}",
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  cartItem.brand! + " " + cartItem.model!,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 18,
                      height: 18,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (states) {
                            return const Color.fromRGBO(200, 200, 200, 1);
                          }),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(0)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                        onPressed: () {
                          CartApiService()
                              .decrementCartItemQty(cartItem.cartItemId);
                        },
                        child: const Text(
                          "-",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      cartItem.quantity.toString(),
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    SizedBox(
                      width: 18,
                      height: 18,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (states) {
                            return const Color.fromRGBO(200, 200, 200, 1);
                          }),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(0)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                        onPressed: () {
                          CartApiService()
                              .incrementCartItemQty(cartItem.cartItemId);
                        },
                        child: const Text(
                          '+',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 3.0,
                ),
                Text(
                  "\$ ${cartItem.amount / 100}",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[500],
                  ),
                )
              ],
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Text(
            "${cartItem.ttlAmount / 100}",
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.red[800],
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            width: 15.0,
          ),
        ],
      ),
    );
  }
}
