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

final userNameSnackBar = SnackBar(
  content: const Text('Pleas enter your user name'),
  action: SnackBarAction(
    label: '',
    textColor: whiteColor,
    onPressed: () {},
  ),
  backgroundColor: errorColor,
  behavior: SnackBarBehavior.floating,
);
final emptyEmailSnackBar = SnackBar(
  content: const Text('Pleas enter your email'),
  action: SnackBarAction(
    label: '',
    textColor: whiteColor,
    onPressed: () {},
  ),
  backgroundColor: errorColor,
  behavior: SnackBarBehavior.floating,
);
final validEmailSnackBar = SnackBar(
  content: const Text('this email is not valid '),
  action: SnackBarAction(
    label: '',
    textColor: whiteColor,
    onPressed: () {},
  ),
  backgroundColor: errorColor,
  behavior: SnackBarBehavior.floating,
);
final shortPasswordSnackBar = SnackBar(
  content: const Text('this password is to weak'),
  action: SnackBarAction(
    label: '',
    textColor: whiteColor,
    onPressed: () {},
  ),
  backgroundColor: errorColor,
  behavior: SnackBarBehavior.floating,
);
final mobileSnackBar = SnackBar(
  content: const Text('Pleas enter your mobile number'),
  action: SnackBarAction(
    label: '',
    textColor: whiteColor,
    onPressed: () {},
  ),
  backgroundColor: errorColor,
  behavior: SnackBarBehavior.floating,
);
final validMobileSnackBar = SnackBar(
  content: const Text('Pleas enter valid mobile number'),
  action: SnackBarAction(
    label: '',
    textColor: whiteColor,
    onPressed: () {},
  ),
  backgroundColor: errorColor,
  behavior: SnackBarBehavior.floating,
);
final passwordSnackBar = SnackBar(
  content: const Text('Pleas enter your password'),
  action: SnackBarAction(
    label: '',
    textColor: whiteColor,
    onPressed: () {},
  ),
  backgroundColor: errorColor,
  behavior: SnackBarBehavior.floating,
);
final citySnackBar = SnackBar(
  content: const Text('Pleas enter your city'),
  action: SnackBarAction(
    label: '',
    textColor: whiteColor,
    onPressed: () {},
  ),
  backgroundColor: errorColor,
  behavior: SnackBarBehavior.floating,
);
final streetSnackBar = SnackBar(
  content: const Text('Pleas enter your street'),
  action: SnackBarAction(
    label: '',
    textColor: whiteColor,
    onPressed: () {},
  ),
  backgroundColor: errorColor,
  behavior: SnackBarBehavior.floating,
);

final buildingNumberSnackBar = SnackBar(
  content: const Text('Pleas enter your building number'),
  action: SnackBarAction(
    label: '',
    textColor: whiteColor,
    onPressed: () {},
  ),
  backgroundColor: errorColor,
  behavior: SnackBarBehavior.floating,
);
