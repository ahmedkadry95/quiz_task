import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task/app/home/model/log_model.dart';
import 'package:task/app/play/model/question_model.dart';
import 'package:task/base_view_model.dart';
import 'package:task/enums/screen_state.dart';
import 'package:task/locator.dart';
import 'package:task/routs/routs_names.dart';
import 'package:task/services/api_service.dart';
import 'package:task/services/navigation_service.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class PlayViewModel extends BaseViewModel {
  var apiServices = locator<ApiService>();
  var navigation = locator<NavigationService>();
  var user = FirebaseAuth.instance.currentUser!;
  List<QuestionModel> questionsList = [];
  List<QuestionModel> randomQuestionsList = [];
  List<int> RandomIndexList = [];
  int result = 0;
  Random random = Random();
  CollectionReference questions =
      FirebaseFirestore.instance.collection('questions');

  getAllQuestions() async {
    QuerySnapshot querySnapshot = await questions.get();
    List<QueryDocumentSnapshot> data = querySnapshot.docs;
    for (var element in data) {
      questionsList.add(QuestionModel.fromJson(element.data()));
    }
    getRandomIndex();
    setState(ViewState.Idle);
  }

  changeValue(dynamic val, int index) {
    randomQuestionsList[index].id = val;
    setState(ViewState.Idle);
  }

  void getRandomIndex() {
    while (RandomIndexList.length < 10) {
      int randomNumber = random.nextInt(questionsList.length);
      if (!RandomIndexList.contains(randomNumber)) {
        RandomIndexList.add(randomNumber);
      }
    }
    print('RandomIndexList');
    print(RandomIndexList);
  }

  getRandomQuestionsList() async {
    await getAllQuestions();
    for (var i in RandomIndexList) {
      randomQuestionsList.add(questionsList[i]);
    }
  }

  calculateResult(int i) {
    result = result + i;
  }

  int answeredQuestions = 0;
  int correctQuestions = 0;
  int wrongQuestions = 0;

  void answerQuestion(int questionIndex, int optionIndex, context) {
    answeredQuestions = answeredQuestions + 1;
    var question = randomQuestionsList[questionIndex];
    if (optionIndex == question.answer) {
      correctQuestions += 1;
    } else {
      wrongQuestions += 1;
    }
    if (answeredQuestions == 10) {
      print('finished');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              tr('quiz_finished'),
            ),
            content: Text(
              '${tr('result')} : $correctQuestions / 10',
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    navigation.navigateToAndClearStack(RouteName.home);
                  },
                  icon: Text(tr('ok')))
            ],
          );
        },
      );
    }
    randomQuestionsList[questionIndex].isAnswered = true;
    randomQuestionsList[questionIndex].selectedAnswer = optionIndex;
    setState(ViewState.Idle);
    logModel?.wrongAnswerCount = wrongQuestions;
    logModel?.correctAnswerCount = correctQuestions;
    logModel?.totalAnswer = answeredQuestions;
    apiServices.createNewLog(logModel!);
  }

  Color getOptionColor(int questionIndex, int optionIndex) {
    var question = randomQuestionsList[questionIndex];
    if (question.isAnswered) {
      if (optionIndex == question.answer) return Colors.green;
      if (optionIndex == question.selectedAnswer) {
        if (question.selectedAnswer == question.answer) {
          return Colors.green;
        } else {
          return Colors.red;
        }
      } else {
        return Colors.grey;
      }
    } else {
      return Colors.grey;
    }
  }

  LogModel? logModel;

  var currentHistoryId = "";

  void createNewLog() {
    currentHistoryId =
        FirebaseFirestore.instance.collection("history").doc().id;

    logModel = LogModel(
      id: currentHistoryId,
      userId: FirebaseAuth.instance.currentUser!.uid,
      totalAnswer: 0,
      wrongAnswerCount: 0,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      correctAnswerCount: 0,
    );
    apiServices.createNewLog(logModel!);
  }
}
