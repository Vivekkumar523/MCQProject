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
      questions: "1.What is  the capital of France?",
      options: ["a) Madrid", "b) Paris", "c) Berlin", "d) Rome"],
      correctAnswerIndex: 1),
  QuestionModel(
      questions: "2. What is the largest lake in the world?",
      options: [
        "a) Caspian Sea",
        "b) Baikal",
        "c) Lake Superior",
        "d) Ontario"
      ],
      correctAnswerIndex: 1),
  QuestionModel(
      questions:
          "3. Which planet in the solar system is known as the “Red Planet”?",
      options: ["a) Venus", "b) Earth", "c) Mars", "d) Jupiter"],
      correctAnswerIndex: 2),
  QuestionModel(
      questions: "4. Who wrote the novel “War and Peace”?",
      options: [
        "a) Anton Chekhov",
        "b) Fyodor Dostoevsky",
        "c) Leo Tolstoy",
        "d) Ivan Turgenev"
      ],
      correctAnswerIndex: 2),
  QuestionModel(
      questions: "5. What is the capital of Japan?",
      options: ["a) Beijing", "b) Tokyo", "c) Seoul", "d) Bangkok"],
      correctAnswerIndex: 1),
  QuestionModel(
      questions: "6. Which of the following planets is not a gas giant?",
      options: ["a) Mars", "b) Jupiter", "c) Saturn", "d) Uranus"],
      correctAnswerIndex: 0)
];
