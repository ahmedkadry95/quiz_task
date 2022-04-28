import 'package:flutter/material.dart';
import 'package:task/app/auth/widgets/auth_snak_bar.dart';
import 'package:task/base_view_model.dart';
import 'package:task/locator.dart';
import 'package:task/services/api_service.dart';
import 'package:task/services/navigation_service.dart';

import '../../../routs/routs_names.dart';

class RegisterViewModel extends BaseViewModel {
  final registerFormKey = GlobalKey<FormState>();
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController mobile = TextEditingController();
  ApiService apiService = locator<ApiService>();
  NavigationService navigation = locator<NavigationService>();

  navigateToLogin() {
    navigation.navigateTo(
      RouteName.logIn,
    );
  }

  validation(BuildContext context) async {
    var mobileNum = int.tryParse(mobile.text);

    if (userName.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(userNameSnackBar);
    } else if (email.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(emptyEmailSnackBar);
    } else if (!email.text.contains('@') || !email.text.contains('.com')) {
      ScaffoldMessenger.of(context).showSnackBar(validEmailSnackBar);
    } else if (password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(passwordSnackBar);
    } else if (password.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(shortPasswordSnackBar);
    } else if (mobile.text.length != 11) {
      ScaffoldMessenger.of(context).showSnackBar(mobileSnackBar);
    } else if (mobileNum!.isNaN) {
      ScaffoldMessenger.of(context).showSnackBar(validMobileSnackBar);
    } else {

      await register();
    }
  }

  register() async {
    String registerResult = await apiService.registerUser(
      email: email.text,
      password: password.text,
      mobile: mobile.text,
      userName: userName.text,
    );

    if (registerResult == 'user add successfully') {
    } else if (registerResult == 'this password is too weak') {
    } else if (registerResult == 'this email is already exist') {}
  }
}
