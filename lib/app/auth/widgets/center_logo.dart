import 'package:flutter/material.dart';

Widget centerLogo() {
  return Align(
    alignment: Alignment.center,
    child: Image.asset(
      'assets/images/logo.png',
      height: 90,
      width: 90,
    ),
  );
}
