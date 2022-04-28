import 'package:flutter/material.dart';
import 'package:task/app/splash/view_model/splash_view_model.dart';
import 'package:task/base_screen.dart';
import 'package:task/utils/colors.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return BaseView<SplashViewModel>(
      onModelReady: (viewModel) {
        viewModel.splashNavigation();
      },
      builder: (context, viewModel, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: purpleColor,
            body: Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: mediaQuery.height * 0.75,
                width: mediaQuery.width * 0.75,
              ),
            ),
          ),
        );
      },
    );
  }
}
