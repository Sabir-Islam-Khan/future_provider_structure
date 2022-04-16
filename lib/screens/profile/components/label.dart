import 'package:flutter/material.dart';

Widget label(String title) {
  return Row(
    children: [
      Text(
        title,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.normal, color: Colors.grey),
      ),
      Text(
        title == "Allergy" || title == "Pre-Exsiting Medical Condition"
            ? ""
            : " *",
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.normal, color: Colors.red),
      ),
    ],
  );
}
