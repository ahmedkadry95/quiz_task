import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task/app/play/model/question_model.dart';
import 'package:task/base_view_model.dart';
import 'package:task/enums/screen_state.dart';
import 'package:task/locator.dart';
import 'package:task/services/api_service.dart';
import 'package:task/services/navigation_service.dart';

class PlayViewModel extends BaseViewModel {
  var apiServices = locator<ApiService>();
  var navigation = locator<NavigationService>();
  var user = FirebaseAuth.instance.currentUser!;
  List<QuestionModel> questionsList = [];
  List<QuestionModel> randomQuestionsList = [];
  List<int> RandomIndexList = [];

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
    while (RandomIndexList.length < 5) {
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
}
