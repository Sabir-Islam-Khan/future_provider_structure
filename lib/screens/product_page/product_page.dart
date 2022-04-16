import 'package:flutter/material.dart';
import 'package:jaaba/provider/product_quantity_provider.dart';
import 'package:jaaba/screens/home/components/app_bar.dart';
import 'package:jaaba/screens/product_page/components/bottomNav.dart';
import 'package:jaaba/utils/api_endpoints.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';

class ProductPage extends StatelessWidget {
  Product? product;
  ProductPage({Key? key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int count = Provider.of<ProductQuantityProvider>(context).getProductCount;
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
            child: CartButton(),
          ),
        ],
      ),
      bottomNavigationBar: customBottomNavBar(
        product!.productId,
        count,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: SizedBox(
                height: 200.0,
                width: 200.0,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.network(
                    ApiUrl.productPictureLink + product!.featurePicture!,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product!.brand!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    "\$ ${product!.amount! / 100}",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    product!.description!,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    "Quantity",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 25,
                        height: 25,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (states) {
                              return const Color.fromRGBO(200, 200, 200, 1);
                            }),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(0)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (count > 1) {
                              Provider.of<ProductQuantityProvider>(context,
                                      listen: false)
                                  .decreaseCount();
                            }
                          },
                          child: const Text(
                            "-",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        count.toString(),
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      SizedBox(
                        width: 25,
                        height: 25,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (states) {
                              return const Color.fromRGBO(200, 200, 200, 1);
                            }),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(0)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Provider.of<ProductQuantityProvider>(context,
                                    listen: false)
                                .increaseCount();
                          },
                          child: const Text(
                            "+",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            r"$  ",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "${product!.amount! / 100}",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          const Text(
                            "  / pack",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
