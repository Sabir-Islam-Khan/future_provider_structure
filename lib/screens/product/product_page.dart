import 'package:flutter/material.dart';

import '../../models/product_model.dart';
import '../../utils/api_endpoints.dart';
import '../../utils/themes.dart';
import '../../widgets/constrained_centre.dart';
import 'components/product_scaffold_widget.dart';
import 'components/bottom_nav_widget.dart';

class ProductPage extends StatelessWidget {
  final Product product;
  const ProductPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _productPictureUrl = ApiUrl.productPictureLink + product.featurePicture!;
    debugPrint('product_page productPictureUrl: $_productPictureUrl \n\n');

    return ProductScaffoldWidget(
      children: [
        ConstrainedCentre(
          child: SizedBox(
          height: ScreenSize.height * 0.2,
            width: ScreenSize.width * 1,
            child: FittedBox(
                fit: BoxFit.fill,
                child: Image.network(_productPictureUrl),
            ),
          ),
        ),
        const SizedBox(height: 20),
        SelectableText(
          'Written by ${product.model}',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        const SizedBox(height: 40),
        SelectableText(
          '${product.brand}',
          style:Theme.of(context).textTheme.headline1,
        ),
        const SizedBox(height: 10),
        SelectableText(
          product.createdOn,
          style: Theme.of(context).textTheme.caption,
        ),
        const SizedBox(height: 20),
        SelectableText(
          '${product.description}',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        bottomNavWidget(product),
      ],
    );
  }
}