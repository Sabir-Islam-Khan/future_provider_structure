import 'package:flutter/material.dart';

import '../../../models/product_model.dart';
import 'promo_product_card_widget.dart';

class PromoProductListWidget extends StatelessWidget {
  final List<Product> products;
  const PromoProductListWidget({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, int index) {
        return PromoProductCardWidget(product: products[index]);
      },
    );
  }
}