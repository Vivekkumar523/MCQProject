import 'package:flutter/material.dart';

import 'package:mcqproject/screen/result_screen.dart';
import 'package:mcqproject/widget/answer_cart.dart';
import 'package:mcqproject/widget/next_button.dart';

import '../models/questions_model.dart';

class QuizeScreen extends StatefulWidget {
  String? title;
  QuizeScreen({super.key, this.title});

  @override
  State<QuizeScreen> createState() => _QuizeScreenState();
}

class _QuizeScreenState extends State<QuizeScreen> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;
  bool isLastQuestion = false;

  pickAnswer(int value) {
    setState(() {
      selectedAnswerIndex = value;
    });
    final question = questionsList[questionIndex];

    isLastQuestion = questionIndex == questionsList.length - 1;
    if (selectedAnswerIndex == question.correctAnswerIndex) {
      score++;
    }
  }

  void goToNextQuestion() {
    setState(() {
      if (questionIndex < questionsList.length - 1) {
        questionIndex++;
        selectedAnswerIndex = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questionsList[questionIndex];
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          widget.title.toString(),
          style: TextStyle(color: Colors.white,fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Text(
                    "Total Question :",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "${questionIndex + 1}/${questionsList.length}", // Update this to display the current question number
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                question.questions,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: ListView.builder(
                  itemCount: question.options.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          if (selectedAnswerIndex == null) {
                            pickAnswer(index);
                          }
                        },
                        child: AnswerCard(
                          question: question.options[index],
                          isSelected: selectedAnswerIndex == index,
                          correctAnswerIndex: question.correctAnswerIndex,
                          selectedAnswerIndex: selectedAnswerIndex ?? -1,
                          currectIndex: index,
                        ));
                  }),
            ),
            isLastQuestion
                ? RectangularButton(
                    label: "Finish",
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => ResultScreen(score: score)));
                    })
                : RectangularButton(
                    label: "Next",
                    onPressed:
                        selectedAnswerIndex != null ? goToNextQuestion : null)
          ],
        ),
      ),
    );
  }
}
