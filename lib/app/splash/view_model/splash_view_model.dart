

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:task/base_view_model.dart';
import 'package:task/locator.dart';
import 'package:task/routs/routs_names.dart';
import 'package:task/services/navigation_service.dart';

class SplashViewModel extends BaseViewModel{
  var navigation = locator<NavigationService>();
  var user = FirebaseAuth.instance.currentUser;


  splashNavigation() async {
    if (user == null) {
      navigationTimer(RouteName.logIn);
    } else {
      navigationTimer(RouteName.home);
    }
  }

  void navigationTimer(String routName) {
    Timer(
      const Duration(seconds: 3),
          () {
        navigation.navigateToAndClearStack(routName);
      },
    );
  }
}