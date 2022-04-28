import 'package:task/app/play/model/question_model.dart';
import 'package:task/base_view_model.dart';
import 'package:task/enums/screen_state.dart';
import 'package:task/locator.dart';
import 'package:task/services/api_service.dart';

class PlayViewModel extends BaseViewModel {
  var apiServices = locator<ApiService>();
  List<QuestionModel> questionsList = [];

  getAllQuestions() async {
    questionsList = await apiServices.getAllQuestions();
    print('questionsList');
    print(questionsList);
    setState(ViewState.Idle);
  }
}
