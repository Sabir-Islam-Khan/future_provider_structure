import 'package:flutter/material.dart';

import '../../../models/product_model.dart';
import 'otc_product_card_widget.dart';

class OtcProductListWidget extends StatelessWidget {
  final List<Product> products;
  const OtcProductListWidget({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, int index) {
        return OtcProductCardWidget(product: products[index]);
      },
    );
  }
}


