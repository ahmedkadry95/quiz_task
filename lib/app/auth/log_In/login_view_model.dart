import 'package:flutter/material.dart';
import 'package:task/app/auth/widgets/auth_snak_bar.dart';
import 'package:task/base_view_model.dart';
import 'package:task/locator.dart';
import 'package:task/routs/routs_names.dart';
import 'package:task/services/api_service.dart';
import 'package:task/services/navigation_service.dart';

class LoginViewModel extends BaseViewModel {
  final logInFormKey = GlobalKey<FormState>();
  final registerFormKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String? loginSuccess;

  ApiService apiService = locator<ApiService>();
  NavigationService navigation = locator<NavigationService>();

  validation(BuildContext context) {
    if (email.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(emptyEmailSnackBar);
    } else if (password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(passwordSnackBar);
    } else if (!email.text.contains('@') || !email.text.contains('.com')) {
      ScaffoldMessenger.of(context).showSnackBar(validEmailSnackBar);
    } else {
      logInWithEmailAndPassword(context);
    }
  }

  logInWithEmailAndPassword(BuildContext context) async {
    loginSuccess = await apiService.signInWithEmailAndPassword(
      email: email.text,
      password: password.text,
    );
    if (loginSuccess! == 'true') {
      navigation.navigateToAndClearStack(RouteName.home);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(failsAuthSnackBar);
    }
  }

  navigateToLogin() {
    navigation.navigateTo(
      RouteName.register,
    );
  }

  tryToLoginWithFaceBook() async {
    try {
      var response = await apiService.signInWithFacebook();
      navigation.navigateToAndClearStack(RouteName.home);
    } catch (e) {
      print(e);
    }
  }

  tryToLoginWithGoogle() async {
    try {
      var response = await apiService.tryLoginWithGoogle();
      navigation.navigateToAndClearStack(RouteName.home);
    } catch (e) {
      print(e);
    }
  }
}
