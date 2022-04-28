import 'package:flutter/material.dart';
import 'package:task/utils/colors.dart';
import 'package:task/utils/spaces.dart';

Widget differentColorsText({
  required String blackText,
  required String purpleText,

}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        blackText,
        style: const TextStyle(
          color: grey,
        ),
      ),
      widthSpace(4),
      Text(
        purpleText,
        style: const TextStyle(
          color: purpleColor,
        ),
      )
    ],
  );
}
