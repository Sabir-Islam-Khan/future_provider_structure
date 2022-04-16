import 'package:flutter/material.dart';

Widget splashScreen() {
  return Container(
    color: Colors.blueGrey[900],
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 200,
        ),
        Image.asset("assets/logo/shrink_icon_compressed.png")
      ],
    ),
  );
}