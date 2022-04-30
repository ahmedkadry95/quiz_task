import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task/app/home/view_model/home_view_model.dart';
import 'package:task/app/home/widgets/home_item.dart';
import 'package:task/base_screen.dart';
import 'package:task/routs/routs_names.dart';
import 'package:task/utils/colors.dart';
import 'package:task/utils/extensions.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  signOut() async {}

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (viewModel) {},
      builder: (context, viewModel, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              backgroundColor: purpleColor,
              title:  Text(
                tr('quiz'),
                style: TextStyle(fontSize: 24),
              ),
              actions: [
                languageItem().onTap(() {
                  if (tr('current_language_iso') == 'ar') {
                    context.setLocale(Locale('en'));
                  } else {
                    context.setLocale(Locale('ar'));
                  }
                }),
              ],
              elevation: 0,
              centerTitle: false,
            ),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 18,
                  childAspectRatio: .95,
                ),
                children: [
                  homeItem(
                    image: 'assets/images/shaps.png',
                    color: blueColor,
                    text: tr('start_quiz'),
                  ).onTap(() {
                    viewModel.navigation.navigateTo(RouteName.play);
                  }),
                  homeItem(
                    image: 'assets/images/history.png',
                    color: orangeColor,
                    text: tr('log'),
                  ).onTap(() {
                    viewModel.navigation.navigateTo(RouteName.log);
                  }),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: purpleColor,
              child: const Icon(Icons.logout),
              onPressed: () async {
                await viewModel.signOut();
              },
            ),
          ),
        );
      },
    );
  }

  Center languageItem() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(10),
        child: Text(
          tr('current_language'),
          style: TextStyle(
            color: purpleColor,
          ),
        ),
      ),
    );
  }
}
