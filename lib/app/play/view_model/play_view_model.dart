import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task/app/play/model/question_model.dart';
import 'package:task/base_view_model.dart';
import 'package:task/enums/screen_state.dart';
import 'package:task/locator.dart';
import 'package:task/services/api_service.dart';

class PlayViewModel extends BaseViewModel {
  var apiServices = locator<ApiService>();
  List<QuestionModel> questionsList = [];
  CollectionReference questions =
  FirebaseFirestore.instance.collection('questions');
  getAllQuestions() async {
    questionsList = await apiServices.getAllQuestions();
    print('questionsList');
    print(questionsList);
    setState(ViewState.Idle);
  }

  // Future<List<QuestionModel>> getAllQuestions() async {
  //   QuerySnapshot querySnapshot = await questions.get();
  //   List<QueryDocumentSnapshot> data = querySnapshot.docs;
  //   for (var element in data) {
  //     questionsList.add(QuestionModel.fromJson(element.data()));
  //   }
  //   return questionsList ;
  // }

}
