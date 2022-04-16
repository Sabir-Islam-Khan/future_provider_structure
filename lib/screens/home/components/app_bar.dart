import 'package:flutter/material.dart';
import 'package:jaaba/models/cart_model.dart';

import 'package:provider/provider.dart';

import '../../../utils/themes.dart';
import '../../cart/cart_page.dart';

Widget customAppBar(String cartData) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const SizedBox(
        height: 20.0,
      ),
      Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 10,
            ),
            child: DrawerButton(),
          ),
          const SizedBox(
            width: 30.0,
          ),
          SizedBox(
            height: 25.0,
            width: 25.0,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Image.asset('assets/logo/logo_1.png'),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          const Text(
            "108",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            "points",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          const CartButton(),
          const SizedBox(
            width: 20.0,
          ),
        ],
      ),
    ],
  );
}

class DrawerButton extends StatelessWidget {
  const DrawerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: globalColor_12LightGrey,
        child: InkWell(
          splashColor: Colors.red[200],
          child: SizedBox(
            width: 40,
            height: 40,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('assets/logo/side_menu.png'),
            ),
          ),
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
    );
  }
}

class CartButton extends StatelessWidget {
  const CartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context);
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
                    builder: (context) => const CartPage(),
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
              cart.cartItemsCount.toString(),
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
