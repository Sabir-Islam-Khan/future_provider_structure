import 'package:flutter/material.dart';
import 'package:jaaba/models/product_model.dart';
import 'package:jaaba/screens/product_page/product_page.dart';

import '../../../models/promo_model.dart';
import '../../../utils/api_endpoints.dart';
import '../../../utils/themes.dart';

Widget promoSection(List<Promo>? promoList) {
  return ListView.builder(
    itemCount: promoList!.length,
    scrollDirection: Axis.horizontal,
    shrinkWrap: true,
    itemBuilder: (context, index) {
      ///// blog post widget ///////////
      return Padding(
        padding: const EdgeInsets.only(top: 5.0, left: 5.0, bottom: 5.0),
        child: SizedBox(
          //height: 100.0,
          width: ScreenSize.width * 0.42,

          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductPage(
                    product: Product(
                      productId: promoList[index].productId,
                      companyId: promoList[index].companyId,
                      featurePicture: promoList[index].featurePicture,
                      brand: promoList[index].brand,
                      model: promoList[index].model,
                      description: promoList[index].description,
                      amount: promoList[index].amount,
                      createdOn: promoList[index].createdOn,
                      links: ProductLinks(
                          selfLink: promoList[index].links.selfLink,
                          supplierLink: promoList[index].links.supplierLink,
                          featurePictureLink:
                              promoList[index].links.featurePictureLink),
                      currencyName: promoList[index].currency,
                      isConsult: promoList[index].isConsult,
                      isOtc: promoList[index].isOtc,
                      isPrescription: promoList[index].isPrescription,
                      isPromo: promoList[index].isPromo,
                    ),
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
                                promoList[index].featurePicture,
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
                          promoList[index].brand,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "\$${promoList[index].amount / 100}",
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
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    color: Colors.red[800],
                    width: 24,
                    height: 48,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "30%",
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        ),
                        Text(
                          "off",
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        )
                      ],
                    ),
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
