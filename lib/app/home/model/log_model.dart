class LogModel {
  int? correctAnswerCount;
  int? createdAt;
  String? id;
  int? totalAnswer;
  String? userId;
  int? wrongAnswerCount;

  LogModel({
    required this.correctAnswerCount,
    required this.createdAt,
    required this.id,
    required this.totalAnswer,
    required this.userId,
    required this.wrongAnswerCount,
  });

  LogModel.fromJson(json) {
    correctAnswerCount = json['correct_answer_count'];
    createdAt = json['created_at'];
    id = json['id'];
    totalAnswer = json['total_answer'];
    userId = json['user_id'];
    wrongAnswerCount = json['wrong_answer_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['correct_answer_count'] = this.correctAnswerCount;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['total_answer'] = this.totalAnswer;
    data['user_id'] = this.userId;
    data['wrong_answer_count'] = this.wrongAnswerCount;
    return data;
  }
}
