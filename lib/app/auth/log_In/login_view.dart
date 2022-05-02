import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task/app/auth/log_In/login_view_model.dart';
import 'package:task/app/auth/widgets/center_logo.dart';
import 'package:task/app/auth/widgets/custom_text_form_field.dart';
import 'package:task/app/auth/widgets/diffrent_colors_text.dart';
import 'package:task/app/auth/widgets/social_login.dart';
import 'package:task/app/widgets/main_button.dart';
import 'package:task/base_screen.dart';
import 'package:task/enums/screen_state.dart';
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
                    blackTitle2(tr('log_in')),
                    heightSpace(30),
                    CustomTextFormField(
                      label: tr('email'),
                      inputType: TextInputType.text,
                      controller: viewModel.email,
                      validator: viewModel.emailValidator(),
                    ),
                    heightSpace(20),
                    CustomTextFormField(
                      label: tr('password'),
                      inputType: TextInputType.text,
                      controller: viewModel.password,
                      isPassword: true,
                      validator: viewModel.passwordValidator(),
                    ),
                    heightSpace(50),
                    viewModel.state == ViewState.Busy
                        ? Center(child: CircularProgressIndicator())
                        : mainButton(
                            text: tr('log_in'),
                          ).onTap(() {
                            viewModel.login(context);
                          }),
                    heightSpace(25),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        tr('login_with'),
                        style: TextStyle(
                          color: grey,
                        ),
                      ),
                    ),
                    heightSpace(25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        socialLogin(
                          'assets/images/fb.png',
                        ).onTap(() {
                          viewModel.signInWithFacebook();
                        }),
                        widthSpace(20),
                        socialLogin('assets/images/g.png').onTap(() {
                          viewModel.tryToLoginWithGoogle();
                        }),
                      ],
                    ),
                    heightSpace(100),
                    differentColorsText(
                      blackText: tr('do_not_have'),
                      purpleText: tr('register'),
                    ).onTap(() {
                      viewModel.navigation.navigateTo(RouteName.register);
                    }),
                    heightSpace(10),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        tr('current_language'),
                        style: TextStyle(color: purpleColor, fontSize: 16),
                      ).onTap(() {
                        if (tr('current_language_iso') == 'ar') {
                          context.setLocale(Locale('en'));
                        } else {
                          context.setLocale(Locale('ar'));
                        }
                      }),
                    ),
                    heightSpace(20),
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
