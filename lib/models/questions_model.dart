class QuestionModel {
  String questions;
  List<String> options;
  int correctAnswerIndex;

  QuestionModel(
      {required this.questions,
      required this.options,
      required this.correctAnswerIndex});
}

List<QuestionModel> questionsList = [
  QuestionModel(
      questions:
          "1.Which Oracle SQL function is used to return the current system date and time?",
      options: [
        "a) SYSDATE",
        "b) SYSTIMESTAMP",
        "c) CURRENT_DATE",
        "d) TO_DATE"
      ],
      correctAnswerIndex: 1),
  QuestionModel(
      questions: "2. Which of the following are valid Oracle SQL data types?",
      options: ["a) VARCHAR2", "b) INTEGER", "c) NUMBER", "d) DATE"],
      correctAnswerIndex: 1),
  QuestionModel(
      questions:
          "3. The GROUP BY clause is used to sort the result set in ascending or descending order.",
      options: ["a) TRUE", "b) FALSE", "c) NONE", "d) ABOVE ALL"],
      correctAnswerIndex: 2),
  QuestionModel(
      questions:
          "4. Which Oracle SQL function is used to return the current system date and time?",
      options: [
        "a) SYSDATE",
        "b) SYSTIMESTAMP",
        "c) CURRENT_DATE",
        "d) TO_DATE"
      ],
      correctAnswerIndex: 1),
  QuestionModel(
      questions:
          "5. The GROUP BY clause is used to sort the result set in ascending or descending order.",
      options: ["a) TRUE", "b) TRUE", "c) NONE", "d) ABOVE ALL"],
      correctAnswerIndex: 2),
  QuestionModel(
      questions: "6. Write SQL Query?",
      options: [
        "a) SYSDATE",
        "b) SYSTIMESTAMP",
        "c) CURRENT_DATE",
        "d) TO_DATE"
      ],
      correctAnswerIndex: 1)
];
