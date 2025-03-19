class QuizQuestionModel {
  String questions;
  List<String> options;
  int correctAnswerIndex;

  QuizQuestionModel({
    required this.questions,
    required this.options,
    required this.correctAnswerIndex,
  });

  // Convert a QuestionModel object to a Map object for SQLite
  Map<String, dynamic> toMap() {
    return {
      'questions': questions,
      'options': options.join(','),
      'correctAnswerIndex': correctAnswerIndex,
    };
  }

  // Convert a Map object to a QuestionModel
  factory QuizQuestionModel.fromMap(Map<String, dynamic> map) {
    return QuizQuestionModel(
      questions: map['questions'],
      options: List<String>.from(map['options'].split(',')),
      correctAnswerIndex: map['correctAnswerIndex'],
    );
  }
}
