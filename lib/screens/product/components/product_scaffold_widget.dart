import 'package:flutter/material.dart';

class ProductScaffoldWidget  extends StatelessWidget {
  final List<Widget> children;
  const ProductScaffoldWidget({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 612,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}