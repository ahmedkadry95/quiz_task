import 'package:flutter/material.dart';
import 'package:task/utils/colors.dart';
import 'package:task/utils/spaces.dart';

Container homeItem({
  required String image,
  required String text,
  required Color color,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: color,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 65,
          width: 65,
        ),
        heightSpace(10),
        Text(
          text,
          style: const TextStyle(color: whiteColor, fontSize: 20),
        )
      ],
    ),
  );
}
