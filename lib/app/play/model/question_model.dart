class QuestionModel {
  String? id, question, lang;
  int? answer,point;
  List? options;
  bool isAnswered = false;
  int selectedAnswer= -1 ;

  QuestionModel(
      this.id, this.question, this.lang, this.answer, this.point, this.options);

  QuestionModel.fromJson(json){
    id = json['id'];
    question = json['question'];
    lang = json['lang'];
    answer = json['answer'];
    options = json['options'];
    point = json['point'];
  }

}
