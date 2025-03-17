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
      "1. Evaluate the following SQL statement:CREATE INDEX upper_name_idx ON product_information(UPPER(product_name)); Which query would use the UPPER_NAME_IDX index?",
      options: [
        "a) SELECT product_jd, UPPER(product_name)FROM product_information WHERE UPPER(product_name)='LASERPRO' OR list_price > 1000;",
        "b) SELECT UPPER(product_name)FROM product_jnformation;",
        "c) SELECT UPPER(product_name)FROM product_information WHERE product_jd = 2254;",
        "d) SELECT product_id FROM product_jnformation WHERE UPPER(product_name) IN ('LASERPRO', 'Cable);"
      ],
      correctAnswerIndex: 0),
  QuestionModel(
      questions:
          "2. Which Oracle SQL function is used to return the current system date and time?",
      options: [
        "a) SYSDATE",
        "b) SYSTIMESTAMP",
        "c) CURRENT_DATE",
        "d) TO_DATE"
      ],
      correctAnswerIndex: 0),
  QuestionModel(
      questions: "3. Which of the following are valid Oracle SQL data types?",
      options: ["a) VARCHAR2", "b) INTEGER", "c) NUMBER", "d) DATE"],
      correctAnswerIndex: 0),
  QuestionModel(
      questions:
          "4. The GROUP BY clause is used to sort the result set in ascending or descending order.",
      options: ["a) TRUE", "b) FALSE", "c) NONE", "d) ABOVE ALL"],
      correctAnswerIndex: 2),
  QuestionModel(
      questions:
          "5. Which Oracle SQL function is used to return the current system date and time?",
      options: [
        "a) SYSDATE",
        "b) SYSTIMESTAMP",
        "c) CURRENT_DATE",
        "d) TO_DATE"
      ],
      correctAnswerIndex: 0),
  QuestionModel(
      questions:
          "6. The GROUP BY clause is used to sort the result set in ascending or descending order.",
      options: ["a) TRUE", "b) TRUE", "c) NONE", "d) ABOVE ALL"],
      correctAnswerIndex: 2),
  QuestionModel(
      questions: "7. Write SQL Query?",
      options: [
        "a) SYSDATE",
        "b) SYSTIMESTAMP",
        "c) CURRENT_DATE",
        "d) TO_DATE"
      ],
      correctAnswerIndex: 0)
];
