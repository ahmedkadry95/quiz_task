import 'package:flutter/material.dart';
import 'package:task/utils/colors.dart';


Widget mainButton({ required String text}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 15),
    decoration: BoxDecoration(
      color: purpleColor,
      borderRadius: BorderRadius.circular(25),
    ),
    child: Text(
      text,
      style: const TextStyle(color: whiteColor, fontSize: 16),
      textAlign: TextAlign.center,
    ),
  );
}
