import 'package:flutter/material.dart';
import 'package:jaaba/screens/product_page/product_page.dart';

import '../../../models/product_model.dart';
import '../../../utils/api_endpoints.dart';
import '../../../utils/themes.dart';

Widget productSection(List<Product>? productList) {
  return ListView.builder(
    itemCount: productList!.length,
    scrollDirection: Axis.horizontal,
    shrinkWrap: true,
    itemBuilder: (context, index) {
      ///// blog post widget ///////////
      return Padding(
        padding: const EdgeInsets.only(top: 5.0, left: 5.0, bottom: 5.0),
        child: Container(
          //height: 100.0,
          width: ScreenSize.width * 0.42,

          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductPage(
                    product: productList[index],
                  ),
                ),
              );
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
                                productList[index].featurePicture!,
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
                          productList[index].brand!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "\$${productList[index].amount! / 100}",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[500]!,
                          ),
                        ),
                        //// // TODO: Supplier name not in product model yet  //////////////
                        Text(
                          "Princeton-Plalonboro",
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
    },
  );
}
