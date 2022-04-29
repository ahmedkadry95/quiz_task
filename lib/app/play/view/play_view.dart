import 'package:flutter/material.dart';
import 'package:task/app/play/view_model/play_view_model.dart';
import 'package:task/base_screen.dart';
import 'package:task/utils/spaces.dart';

class PlayView extends StatelessWidget {
  const PlayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<PlayViewModel>(
      onModelReady: (viewModel) {
        viewModel.getAllQuestions();
      },
      builder: (context, viewModel, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: ListView.separated(
              itemCount: viewModel.questionsList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Text('${viewModel.questionsList[index].question}'),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return heightSpace(20);
              },
            ),
          ),
        );
      },
    );
  }
}
