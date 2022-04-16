import 'package:flutter/material.dart';
import 'package:jaaba/models/company_model.dart';
import 'package:jaaba/screens/booking/booking.dart';

import '../../../utils/themes.dart';

Widget customBottomNavBar(Company clinic, BuildContext context) {
  return Container(
    height: ScreenSize.height * 0.08,
    width: ScreenSize.width * 1,
    color: globalColor_13DarkBlue,
    child: Center(
      child: Row(
        children: [
          SizedBox(
            width: ScreenSize.width * 0.57,
          ),
          bookClinic(clinic, context),
        ],
      ),
    ),
  );
}

Widget bookClinic(Company clinic, BuildContext context) {
  return GestureDetector(
    onTap: () async {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BookingPage(company: clinic),
        ),
      );
    },
    child: Container(
      height: ScreenSize.height * 0.05,
      width: ScreenSize.width * 0.37,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.blue,
      ),
      child: const Center(
        child: Text(
          "BOOK NOW",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}
