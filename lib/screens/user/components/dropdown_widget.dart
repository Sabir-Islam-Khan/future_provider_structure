import 'dart:math';
import 'package:flutter/material.dart';

import '../../../utils/themes.dart';

const String value = '';
const List<DropdownMenuItem<String>> items = [];
const String onChanged = '';

Widget dropdownWidget({value=value, items=items, onChanged=onChanged}) {

  return DropdownButton<String>(
    value: value,
    items: items,
    isExpanded: true,
    onChanged: onChanged,
    icon: Row(
      children: [
        Transform.translate(
          offset: const Offset(0, -10),
          child: Transform.rotate(
            angle: -pi / 2,
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey[600],
              size: ScreenSize.height * 0.022,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        )
      ],
    ),
    elevation: 16,
    style: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    underline: Container(
      margin: const EdgeInsets.only(right: 15.0),
      height: 1,
      color: Colors.grey,
    ),
  );
}





