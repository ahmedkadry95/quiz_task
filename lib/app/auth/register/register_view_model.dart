import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task/app/auth/widgets/auth_snak_bar.dart';
import 'package:task/base_view_model.dart';
import 'package:task/enums/screen_state.dart';
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

  FormFieldValidator<String>? userNameValidator() {
    FormFieldValidator<String>? validator = (value) {
      if (value == null || value.isEmpty) {
        return tr('enter_user_name');
      }
      return null;
    };
    return validator;
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
      if (value.length < 6) {
        return tr('valid_password');
      }
      return null;
    };
    return validator;
  }

  FormFieldValidator<String>? mobileValidator() {
    FormFieldValidator<String>? validator = (value) {
      if (value == null || value.isEmpty) {
        return tr('enter_mobile');
      }
      if (value.length != 11) {
        return tr('valid_mobile');
      }
      return null;
    };
    return validator;
  }

  void register(BuildContext context) async {
    if (registerFormKey.currentState!.validate()) {
      setState(ViewState.Busy);
      String registerResult = await apiService.registerUser(
        email: email.value.text.toString().trim(),
        password: password.text,
        mobile: mobile.text,
        userName: userName.text,
      );
      switch (registerResult) {
        case 'user add successfully':
          {
            ScaffoldMessenger.of(context)
                .showSnackBar(successfulRegisterSnackBar);
            navigation.navigateToAndClearStack(RouteName.home);
          }
          break;
        case 'this password is too weak':
          {
            print('this password is too weak');
          }
          break;
        case 'this email is already exist':
          {
            ScaffoldMessenger.of(context).showSnackBar(existSnackBar);
          }
          break;
        default:
          {}
          break;
      }
      setState(ViewState.Idle);
    }
  }
}
