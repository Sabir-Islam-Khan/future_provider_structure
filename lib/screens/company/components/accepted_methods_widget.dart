// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Widget acceptedMethodSectionWidget() {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Text(
          "Accepts",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Rail Insure, Medical",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
        Text(
          "Ruby Insure, Dental",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
