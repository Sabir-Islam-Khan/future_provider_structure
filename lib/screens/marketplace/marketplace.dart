import 'package:flutter/material.dart';
import 'package:jaaba/models/promo_model.dart';
import 'package:jaaba/screens/marketplace/components/product_section.dart';
import 'package:jaaba/screens/marketplace/components/promo_section.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../models/product_model.dart';
import '../../utils/themes.dart';

class MarketplacePage extends StatelessWidget {
  const MarketplacePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Product> productsList = Provider.of<List<Product>>(context);
    //  final List<Promo> promosList = Provider.of<List<Promo>>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
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
      ),
      body: SlidingUpPanel(
        color: const Color.fromARGB(255, 223, 237, 251),
        renderPanelSheet: true,
        maxHeight: ScreenSize.height * 0.6,
        minHeight: ScreenSize.height * 0.6,
        parallaxEnabled: true,
        parallaxOffset: 0.6,
        panelBuilder: (homeScrollController) => buildSlidePanel(
          homeScrollController: homeScrollController,
          context: context,
          productList: productsList,
          ///////// TODO : add promo feature ///////////////////
          promoList: [],
        ),
        body: Stack(
          children: [
            Container(
              height: ScreenSize.height * 0.5,
              width: ScreenSize.width * 1,
              color: Colors.white,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Opacity(
                  opacity: 0.35,
                  child: Image.asset('assets/images/doctor_one.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildSlidePanel(
    {@required ScrollController? homeScrollController,
    BuildContext? context,
    @required List<Product>? productList,
    @required List<Promo>? promoList}) {
  return SingleChildScrollView(
    physics: const NeverScrollableScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5.0,
        ),
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
          child: promoSection(promoList),
        ),
        const SizedBox(
          height: 5.0,
        ),
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
        Container(
          height: 185.0,
          child: productSection(productList),
        ),
      ],
    ),
  );
}
