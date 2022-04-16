import 'package:flutter/material.dart';

import '../../../models/product_model.dart';
import '../../../utils/api_endpoints.dart';
import '../../../utils/themes.dart';
import '../../product/product_page.dart';

class PromoProductCardWidget extends StatelessWidget {
  final Product product;
  const PromoProductCardWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 5.0, bottom: 5.0),
      child: SizedBox(
        //height: 100.0,
        width: ScreenSize.width * 0.48,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return ProductPage(product: product);
                }
            ));
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12.0,
                  ),
                  Center(
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Image.network(
                          ApiUrl.productPictureLink +
                              product.featurePicture!,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.brand ?? '',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "\$ ${product.amount ?? 0 / 100}",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[500]!,
                        ),
                      ),
                      //// // TODO: Supplier name not in product model yet  //////////////
                      Text(
                        'Supplier',
                        // '${product.supplier}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[500]!,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Positioned(
                right: 0.0,
                top: 5.0,
                child: Icon(
                  Icons.star,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}