import 'package:flutter/material.dart';

Widget labelWidget(String label) {
  return Padding(
    padding: EdgeInsets.only(left: 15),
    child: Row(
      children: [
        Text(
          label,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.normal, color: Colors.grey),
        ),
        Text(
          " *",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.normal, color: Colors.red),
        ),
      ],
    ),
  );
}