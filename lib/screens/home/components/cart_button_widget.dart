import 'package:flutter/material.dart';
import 'package:jaaba/screens/cart/cart_page.dart';
import 'package:provider/provider.dart';

import '../../../models/cart_model.dart';

class CartButtonWidget extends StatelessWidget {
  const CartButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Cart cartData = Provider.of<Cart>(context);
    return Stack(
      children: [
        ClipOval(
          child: Material(
            color: Colors.white,
            child: InkWell(
              splashColor: Colors.red[200],
              child: SizedBox(
                width: 35,
                height: 35,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset('assets/logo/cart_icon.png'),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ),
                );
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 16,
            height: 16,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.red[200],
              borderRadius: BorderRadius.circular(9),
            ),
            child: Text(
              cartData.cartItemsCount!.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 11.0,
              ),
            ),
          ),
        )
      ],
    );
  }
}
