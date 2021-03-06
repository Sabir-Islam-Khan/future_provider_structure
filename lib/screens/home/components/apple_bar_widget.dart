import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/cart_model.dart';
import '../../cart/cart_page.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context);
    return AppBar(
      actions: <Widget>[
        Padding(padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 150.0,
            width: 30.0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder:(BuildContext context) =>
                      CartPage()
                  )
                );
              },

              child: Stack(
                children: <Widget>[
                  IconButton(icon: const Icon(Icons.shopping_cart,
                    color: Colors.white,),
                    onPressed: null,
                  ),
                  cart.cartItemsCount ==0 ? Container() :
                  Positioned(
                    child: Stack(
                      children: <Widget>[
                        Icon(
                            Icons.brightness_1,
                            size: 20.0, color: Colors.green[800]),
                        Positioned(
                          top: 3.0,
                          right: 4.0,
                          child: Center(
                            child: Text(
                              cart.cartItemsCount.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

            ),
          ),
        ),
      ],
    );
  }
}
