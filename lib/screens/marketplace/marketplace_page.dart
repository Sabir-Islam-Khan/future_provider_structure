import 'package:flutter/material.dart';

import '../../models/product_model.dart';
import 'components/promo_product_List_widget.dart';

class MarketplacePage extends StatelessWidget {
  final List<Product> products;
  const MarketplacePage({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5.0,
            ),

            ///////////////////// otcProductList Row ////////////////////
            Row(
              children: [
                const SizedBox(
                  width: 15.0,
                ),
                const Text(
                  "PROMO",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Text(
                  "See All  ",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[500],
                  ),
                ),
                const Text(
                  ">",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 15.0,
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            SizedBox(
              height: 185.0,
              ///////////////////// promoProduct ListView ////////////////////
              child: PromoProductListWidget(products: products),
            ),
            const SizedBox(
              height: 5.0,
            ),

            ///////////////////// otcProductList Row ////////////////////
            Row(
              children: [
                const SizedBox(
                  width: 15.0,
                ),
                const Text(
                  "MARKETPLACE",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Text(
                  "See All  ",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[500],
                  ),
                ),
                const Text(
                  ">",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 15.0,
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            SizedBox(
              height: 185.0,
              ///////////////////// otcProduct ListView ////////////////////
              child: PromoProductListWidget(products: products),
            ),
          ],
        ),
      ),
    );
  }
}