import 'package:flutter/material.dart';
import 'package:jaaba/models/suppliers_model.dart';
import 'package:jaaba/screens/cart/components/suppliers_widget.dart';
import 'package:provider/provider.dart';

import '../../models/cart_model.dart';
import '../../models/cart_item_model.dart';
import '../../utils/themes.dart';
import 'components/bottom_bar_widget.dart';
import '../cart/components/cart_item_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<CartItem> cartItems = Provider.of<List<CartItem>>(context);
    final Cart cart = Provider.of<Cart>(context);

    final List<Supplier> suppliers = Provider.of<List<Supplier>>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Transform.scale(
          scale: 0.7,
          child: ClipOval(
            child: Container(
              height: 20.0,
              width: 20.0,
              color: Colors.grey[200],
              child: InkWell(
                splashColor: Colors.red[200],
                child: const SizedBox(
                  width: 40,
                  height: 40,
                  child: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.grey,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(top: 10.0, right: 15.0),
            //child: CartButton(),
          ),
        ],
      ),
      bottomNavigationBar: bottomBarWidget(cart.grandTotal!),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15.0,
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              return CartItemWidget(
                cartItem: cartItems[index],
              );
            },
          ),

          const SizedBox(
            height: 15.0,
          ),

          suppliersWidget(suppliers),
          // ListView.builder(
          //   itemCount: cart.,
          // ),
          //////// TODO :   imnplement delivery address later //////////
          const SizedBox(
            height: 15.0,
          ),
          suppliers.isNotEmpty
              ? const Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                  ),
                  child: Text(
                    "Tax",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          const SizedBox(
            height: 10.0,
          ),
          suppliers.isNotEmpty
              ? Row(
                  children: [
                    const SizedBox(
                      width: 20.0,
                    ),
                    SizedBox(
                      width: ScreenSize.width * 0.5,
                      child: const Text(
                        "Singapore -7% GST",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Text(
                      "${cart.taxSubtotal! / 100}",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.red[700],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      width: 25.0,
                    ),
                  ],
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
