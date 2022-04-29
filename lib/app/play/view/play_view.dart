import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task/app/play/view_model/play_view_model.dart';
import 'package:task/base_screen.dart';
import 'package:task/utils/spaces.dart';
import '../../../utils/colors.dart';

class PlayView extends StatelessWidget {
  const PlayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<PlayViewModel>(
      onModelReady: (viewModel) {
        viewModel.getRandomQuestionsList();
      },
      builder: (context, viewModel, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: purpleColor,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  viewModel.navigation.goBack();
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: ListView.builder(
                itemCount: viewModel.randomQuestionsList.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(top: 25, bottom: 25),
                    color: whiteGreen,
                    elevation: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        heightSpace(15),
                        Text(
                          '${viewModel.randomQuestionsList[index].question}',
                          textDirection:
                              viewModel.randomQuestionsList[index].lang == 'ar'
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                        ),
                        RadioListTile(
                          title: Text(
                            viewModel
                                .randomQuestionsList[index].wrongAnswerOne!,
                          ),
                          value: viewModel
                              .randomQuestionsList[index].wrongAnswerOne
                              .toString(),
                          groupValue: viewModel.randomQuestionsList[index].id,
                          onChanged: (val) {
                            viewModel.changeValue(val, index);
                          },
                        ),
                        RadioListTile(
                          title: Text(viewModel
                              .randomQuestionsList[index].correctAnswer!),
                          value: viewModel
                              .randomQuestionsList[index].correctAnswer!,
                          groupValue: viewModel.randomQuestionsList[index].id,
                          onChanged: (val) {
                            viewModel.changeValue(val, index);
                          },
                        ),
                        RadioListTile(
                          title: Text(viewModel
                              .randomQuestionsList[index].wrongAnswerTwo!),
                          value: viewModel
                              .randomQuestionsList[index].wrongAnswerTwo!,
                          groupValue: viewModel.randomQuestionsList[index].id,
                          onChanged: (val) {
                            viewModel.changeValue(val, index);
                          },
                        ),
                        heightSpace(15),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
