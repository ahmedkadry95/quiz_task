class QuestionModel {
  String? question, correctAnswer, wrongAnswerOne, wrongAnswerTwo;

  QuestionModel(this.question, this.correctAnswer, this.wrongAnswerOne,
      this.wrongAnswerTwo);

  QuestionModel.fromJson(json) {
    question = json['question'];
    correctAnswer = json['correct_answer'];
    wrongAnswerOne = json['wrong_answer_one'];
    wrongAnswerTwo = json['wrong_answer_two'];
  }
}
