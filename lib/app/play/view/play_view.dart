import 'package:flutter/material.dart';
import 'package:task/app/play/view_model/play_view_model.dart';
import 'package:task/base_screen.dart';
import 'package:task/utils/extensions.dart';
import 'package:task/utils/spaces.dart';
import '../../../utils/colors.dart';

class PlayView extends StatelessWidget {
  const PlayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<PlayViewModel>(
      onModelReady: (viewModel) {
        viewModel.getRandomQuestionsList();
        viewModel.createNewLog();
      },
      builder: (context, viewModel, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: purpleColor,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  viewModel.navigation.goBack();
                },
              ),
            ),
            body: viewModel.randomQuestionsList.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: purpleColor,
                    ),
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          ...viewModel.randomQuestionsList.map((question) {
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: Card(
                                elevation: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      heightSpace(20),
                                      Text(
                                        question.question!,
                                        textAlign: question.lang == 'ar'
                                            ? TextAlign.right
                                            : TextAlign.left,
                                        textDirection: question.lang == 'ar'
                                            ? TextDirection.rtl
                                            : TextDirection.ltr,
                                      ),
                                      heightSpace(10),
                                      Column(
                                        children: <Widget>[
                                          ...question.options!.map(
                                            (option) {
                                              return Container(
                                                alignment: Alignment.center,
                                                width: double.infinity,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                margin: const EdgeInsets.all(5),
                                                child: Text(option),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    color: viewModel.getOptionColor(
                                                        viewModel
                                                            .randomQuestionsList
                                                            .indexOf(question),
                                                        question.options!
                                                            .indexOf(option))),
                                              ).onTap(() {
                                                if (question.isAnswered) return;
                                                int questionIndex = viewModel
                                                    .randomQuestionsList
                                                    .indexOf(question);
                                                int optionIndex = question
                                                    .options!
                                                    .indexOf(option);

                                                print(
                                                    'questionIndex : $questionIndex ,optionIndex : $optionIndex ');

                                                viewModel.answerQuestion(
                                                    questionIndex,
                                                    optionIndex,
                                                    context);
                                              });
                                            },
                                          ),
                                          heightSpace(20),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
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

  Widget answerButton(e, PlayViewModel viewModel, bool isSelected) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.all(5),
      child: Text(e),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: isSelected ? purpleColor : dividerColor,
      ),
    );
  }
}
