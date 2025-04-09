class QuestionModel {
  int? id;
  String questions;
  List<String> options;
  int correctAnswerIndex;
  int? selectedAnswerIndex;

  QuestionModel(
      {required this.id,
        required this.questions,
      required this.options,
      required this.correctAnswerIndex,
      required this.selectedAnswerIndex});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': questions,
      'options': options.join('||'),
      'correctAnswerIndex': correctAnswerIndex,
      'selectedAnswerIndex': selectedAnswerIndex,
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      id: map['id'],
      questions: map['questions'],
      options: (map['options'] as String).split('||'),
      correctAnswerIndex: map['correctAnswerIndex'],
      selectedAnswerIndex: map['selectedAnswerIndex'],
    );
  }
}

List<QuestionModel> questionsList = [
  QuestionModel(
      id: 1,
      questions:
      "1. Evaluate the following SQL statement:CREATE INDEX upper_name_idx ON product_information(UPPER(product_name)); Which query would use the UPPER_NAME_IDX index?",
      options: [
        "a) SELECT product_jd, UPPER(product_name)FROM product_information WHERE UPPER(product_name)='LASERPRO' OR list_price > 1000;",
        "b) SELECT UPPER(product_name)FROM product_jnformation;",
        "c) SELECT UPPER(product_name)FROM product_information WHERE product_jd = 2254;",
        "d) SELECT product_id FROM product_jnformation WHERE UPPER(product_name) IN ('LASERPRO', 'Cable);"
      ],
      correctAnswerIndex: 0,
      selectedAnswerIndex: 0),
  QuestionModel(
    id: 2,
      questions:
          "2. Which Oracle SQL function is used to return the current system date and time?",
      options: [
        "a) SYSDATE",
        "b) SYSTIMESTAMP",
        "c) CURRENT_DATE",
        "d) TO_DATE"
      ],
      correctAnswerIndex: 0,
  selectedAnswerIndex: 0),
  QuestionModel(
    id: 3,
      questions: "3. Which of the following are valid Oracle SQL data types?",
      options: ["a) VARCHAR2", "b) INTEGER", "c) NUMBER", "d) DATE"],
      correctAnswerIndex: 0,
  selectedAnswerIndex: 0),
  QuestionModel(
    id: 4,
      questions:
          "4. The GROUP BY clause is used to sort the result set in ascending or descending order.",
      options: ["a) TRUE", "b) FALSE", "c) NONE", "d) ABOVE ALL"],
      correctAnswerIndex: 2,
  selectedAnswerIndex: 0),
  QuestionModel(
    id: 5,
      questions:
          "5. Which Oracle SQL function is used to return the current system date and time?",
      options: [
        "a) SYSDATE",
        "b) SYSTIMESTAMP",
        "c) CURRENT_DATE",
        "d) TO_DATE"
      ],
      correctAnswerIndex: 0,
  selectedAnswerIndex: 0),
  QuestionModel(
    id: 6,
      questions:
          "6. The GROUP BY clause is used to sort the result set in ascending or descending order.",
      options: ["a) TRUE", "b) TRUE", "c) NONE", "d) ABOVE ALL"],
      correctAnswerIndex: 2,
  selectedAnswerIndex: 0),
  QuestionModel(
    id: 7,
      questions: "7. Write SQL Query?",
      options: [
        "a) SYSDATE",
        "b) SYSTIMESTAMP",
        "c) CURRENT_DATE",
        "d) TO_DATE"
      ],
      correctAnswerIndex: 0,
  selectedAnswerIndex: 0)
];
