import 'package:flutter/material.dart';

Widget textFieldWidget(TextEditingController txController) {
  return Padding(
    padding: const EdgeInsets.only(right: 15.0),
    child: TextField(
      controller: txController,
      autofocus: false,
      maxLines: 1,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
    ),
  );
}