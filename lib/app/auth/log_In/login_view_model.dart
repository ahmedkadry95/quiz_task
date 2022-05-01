import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task/app/auth/widgets/auth_snak_bar.dart';
import 'package:task/base_view_model.dart';
import 'package:task/enums/screen_state.dart';
import 'package:task/locator.dart';
import 'package:task/routs/routs_names.dart';
import 'package:task/services/api_service.dart';
import 'package:task/services/navigation_service.dart';

class LoginViewModel extends BaseViewModel {
  final logInFormKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String? loginSuccess;

  ApiService apiService = locator<ApiService>();
  NavigationService navigation = locator<NavigationService>();

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
      print('try login with facebook');
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

  void login(BuildContext context) async {
    if (logInFormKey.currentState!.validate()) {
      setState(ViewState.Busy);
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
    setState(ViewState.Idle);
  }

  FormFieldValidator<String>? emailValidator() {
    FormFieldValidator<String>? validator = (value) {
      if (value == null || value.isEmpty) {
        return tr('enter_email');
      }
      if (!isValidEmail(value.trim())) {
        return tr('valid_email');
      }
      return null;
    };
    return validator;
  }

  bool isValidEmail(String email) {
    bool emailValid = RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
    return emailValid;
  }

  FormFieldValidator<String>? passwordValidator() {
    FormFieldValidator<String>? validator = (value) {
      if (value == null || value.isEmpty) {
        return tr('enter_password');
      }

      return null;
    };
    return validator;
  }
}
