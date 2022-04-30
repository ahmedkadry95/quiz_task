import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task/app/auth/register/register_view_model.dart';
import 'package:task/app/auth/widgets/center_logo.dart';
import 'package:task/app/auth/widgets/custom_text_form_field.dart';
import 'package:task/app/auth/widgets/diffrent_colors_text.dart';
import 'package:task/app/widgets/main_button.dart';
import 'package:task/base_screen.dart';
import 'package:task/enums/screen_state.dart';
import 'package:task/routs/routs_names.dart';
import 'package:task/utils/colors.dart';
import 'package:task/utils/extensions.dart';
import 'package:task/utils/spaces.dart';
import 'package:task/utils/texts.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterViewModel>(
      onModelReady: (viewModel) {},
      builder: (context, viewModel, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: backgroundColor,
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
              child: Form(
                key: viewModel.registerFormKey,
                child: ListView(
                  children: [
                    centerLogo(),
                    heightSpace(50),
                    blackTitle2(tr('register')),
                    heightSpace(30),
                    CustomTextFormField(
                      label: tr('user_name'),
                      inputType: TextInputType.text,
                      controller: viewModel.userName,
                      isPassword: false,
                      validator: viewModel.userNameValidator(),
                    ),
                    heightSpace(20),
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
                    heightSpace(20),
                    CustomTextFormField(
                      label: tr('mobile'),
                      inputType: TextInputType.number,
                      controller: viewModel.mobile,
                      isPassword: false,
                      validator: viewModel.mobileValidator(),
                    ),
                    heightSpace(50),
                    viewModel.state == ViewState.Busy
                        ? Center(
                            child: Center(
                                child: CircularProgressIndicator(
                            color: purpleColor,
                          )))
                        : mainButton(
                            text: tr('register'),
                          ).onTap(() {
                            viewModel.register(context);
                          }),
                    heightSpace(20),
                    differentColorsText(
                      blackText: tr('have_acc'),
                      purpleText: tr('log_in'),
                    ).onTap(() {
                      viewModel.navigation.navigateTo(RouteName.logIn);
                    }),
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
