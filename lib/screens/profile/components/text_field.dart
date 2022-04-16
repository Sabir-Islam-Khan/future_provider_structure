import 'package:flutter/material.dart';

Widget textField(TextEditingController textEditingController) {
  return Padding(
    padding: const EdgeInsets.only(right: 15.0),
    child: TextField(
      controller: textEditingController,
    ),
  );
}
