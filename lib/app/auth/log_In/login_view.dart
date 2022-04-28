import 'package:flutter/material.dart';
import 'package:task/app/auth/log_In/login_view_model.dart';
import 'package:task/app/auth/widgets/center_logo.dart';
import 'package:task/app/auth/widgets/custom_text_form_field.dart';
import 'package:task/app/auth/widgets/diffrent_colors_text.dart';
import 'package:task/app/auth/widgets/social_login.dart';
import 'package:task/app/widgets/main_button.dart';
import 'package:task/base_screen.dart';
import 'package:task/routs/routs_names.dart';
import 'package:task/utils/colors.dart';
import 'package:task/utils/extensions.dart';
import 'package:task/utils/spaces.dart';
import 'package:task/utils/texts.dart';

class LogInView extends StatelessWidget {
  const LogInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return BaseView<LoginViewModel>(
      onModelReady: (viewModel) {},
      builder: (context, viewModel, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: backgroundColor,
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
              child: Form(
                key: viewModel.logInFormKey,
                child: ListView(
                  children: [
                    centerLogo(),
                    heightSpace(50),
                    blackTitle2('Log In'),
                    heightSpace(30),
                    CustomTextFormField(
                      label: 'Email',
                      inputType: TextInputType.text,
                      controller: viewModel.email,
                    ),
                    heightSpace(20),
                    CustomTextFormField(
                      label: 'Password',
                      inputType: TextInputType.text,
                      controller: viewModel.password,
                      isPassword: true,
                    ),
                    heightSpace(50),
                    mainButton(
                      text: 'Log In',
                    ).onTap(() {
                      viewModel.validation(context);
                    }),
                    heightSpace(20),
                    differentColorsText(
                            blackText: 'don\'t have account ?',
                            purpleText: 'Register')
                        .onTap(() {
                      viewModel.navigation.navigateTo(RouteName.register);
                    }),
                    heightSpace(mediaQuery.height * 0.25),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Or you can log in with',
                        style: TextStyle(
                          color: grey,
                        ),
                      ),
                    ),
                    heightSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        socialLogin(
                          'assets/images/fb.png',
                        ).onTap(() {
                          viewModel.tryToLoginWithFaceBook();
                        }),
                        widthSpace(20),
                        socialLogin('assets/images/g.png').onTap(() {
                          viewModel.tryToLoginWithGoogle();
                        }),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
