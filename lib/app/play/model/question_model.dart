class QuestionModel {
  String? id, question, correctAnswer, wrongAnswerOne, wrongAnswerTwo ,lang;

  QuestionModel(this.id, this.question, this.correctAnswer, this.wrongAnswerOne,
      this.wrongAnswerTwo, this.lang);


  QuestionModel.fromJson(json) {
    id = json['id'];
    question = json['question'];
    correctAnswer = json['correct'];
    wrongAnswerOne = json['wrong_one'];
    wrongAnswerTwo = json['wrong_two'];
    lang = json['lang'];
  }
}
