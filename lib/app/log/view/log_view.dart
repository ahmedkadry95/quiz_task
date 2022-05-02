import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task/app/log/view_model/log_view_model.dart';
import 'package:task/base_screen.dart';
import 'package:task/utils/colors.dart';

class LogView extends StatelessWidget {
  const LogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LogViewModel>(
      onModelReady: (viewModel) {
        viewModel.getUserLog();
      },
      builder: (context, viewModel, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: purpleColor,
              centerTitle: true,
              title: Text(tr('log')),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  viewModel.navigation.goBack();
                },
              ),
            ),
            body: ListView.builder(
              itemCount: viewModel.logList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                        backgroundColor: pinkColor,
                        child: Text((viewModel.logList
                                    .indexOf(viewModel.logList[index]) +
                                1)
                            .toString())),
                    title: Text(
                      '${tr('created_at')}  ${viewModel.dateFormat.format(DateTime.fromMillisecondsSinceEpoch(
                        viewModel.logList[index].createdAt!,
                      ))}',
                      style: TextStyle(fontSize: 15),
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            '${tr('correct_answer')} ${viewModel.logList[index].correctAnswerCount}'),
                        Text(
                            '${tr('wrong_answer')} ${viewModel.logList[index].wrongAnswerCount}'),
                        Text(
                            '${tr('total_answer')} ${viewModel.logList[index].totalAnswer}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
