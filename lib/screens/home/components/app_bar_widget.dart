import 'package:flutter/material.dart';

import '../../../utils/themes.dart';
import 'cart_button_widget.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20.0,
        ),
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: 20,
              ),
              child: DrawerButton(),
            ),
            const SizedBox(
              width: 30.0,
            ),
            SizedBox(
              height: 25.0,
              width: 25.0,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Image.asset('assets/logo/logo_1.png'),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const Text(
              "108",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "points",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            const CartButtonWidget(),
            const SizedBox(
              width: 20.0,
            ),
          ],
        ),
      ],
    );
  }
}

//////////////////////////// DrawerButton Widget //////////////////////////////
class DrawerButton extends StatelessWidget {
  const DrawerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: globalColor_12LightGrey,
        child: InkWell(
          splashColor: Colors.red[200],
          child: SizedBox(
            width: 40,
            height: 40,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('assets/logo/side_menu.png'),
            ),
          ),
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
    );
  }
}