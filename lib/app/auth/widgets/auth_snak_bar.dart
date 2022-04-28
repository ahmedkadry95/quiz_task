import 'package:flutter/material.dart';
import 'package:task/utils/colors.dart';

final failsAuthSnackBar = SnackBar(
  content: const Text('sorry : your email or password is wrong '),
  action: SnackBarAction(
    label: 'Try again',
    textColor: whiteColor,
    onPressed: () {},
  ),
  backgroundColor: errorColor,
  behavior: SnackBarBehavior.floating,
);

final successfulRegisterSnackBar = SnackBar(
  content: const Text('your account created successfully'),
  action: SnackBarAction(
    label: '',
    textColor: whiteColor,
    onPressed: () {},
  ),
  duration: Duration(milliseconds: 5),
  backgroundColor: successfulColor,
  behavior: SnackBarBehavior.floating,
);

final existSnackBar = SnackBar(
  content: const Text('this email is already exist'),
  action: SnackBarAction(
    label: '',
    textColor: whiteColor,
    onPressed: () {},
  ),
  duration: Duration(seconds: 5),
  backgroundColor: errorColor,
  behavior: SnackBarBehavior.floating,
);
