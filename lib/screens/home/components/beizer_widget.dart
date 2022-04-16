import 'package:flutter/material.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';

import '../../../utils/themes.dart';

Widget beizerWidget(double totalWidth) {
  return ClipPath(
    clipper: ProsteBezierCurve(
      position: ClipPosition.bottom,
      list: [
        BezierCurveSection(
          start: const Offset(0, 130),
          top: Offset(totalWidth / 4, 150),
          end: Offset(totalWidth / 2, 125),
        ),
        BezierCurveSection(
          start: Offset(totalWidth / 3, 125),
          top: Offset(totalWidth / 4 * 3, 100),
          end: Offset(totalWidth, 140),
        ),
      ],
    ),
    child: Container(
      height: 150.0,
      color: mainBlue,
    ),
  );
}