import 'package:flutter/material.dart';

import 'package:mcqproject/screen/result_screen.dart';
import 'package:mcqproject/widget/answer_cart.dart';
import 'package:mcqproject/widget/next_button.dart';

import '../models/questions_model.dart';
import '../sqflite/database_manager.dart';

// ignore: must_be_immutable
class QuizeScreen extends StatefulWidget {
  String? title;

  QuizeScreen({super.key, this.title});

  @override
  State<QuizeScreen> createState() => _QuizeScreenState();
}

class _QuizeScreenState extends State<QuizeScreen> {
  int? selectedAnswerIndex = -1;
  int questionIndex = 0;
  int score = 0;
  bool isLastQuestion = false;
  bool isLevelCompleted = false;

  pickAnswer(int value) {
    setState(() {
      selectedAnswerIndex = value;
    });
    final question = questionsList[questionIndex];
    isLastQuestion = questionIndex == questionsList.length - 1;
    if (selectedAnswerIndex == question.correctAnswerIndex) {
      score++;
    }
    QuestionModel questionModel = QuestionModel(
        id: questionIndex,
        questions: questionsList[questionIndex].questions,
        options: questionsList[questionIndex].options,
        selectedAnswerIndex: selectedAnswerIndex,
        correctAnswerIndex: questionsList[questionIndex].correctAnswerIndex);
    // return;
    DatabaseHelper.insertQuestion(questionModel);
  }

  void goToNextQuestion() {
    setState(() {
      if (questionIndex < questionsList.length - 1) {
        questionIndex++;
        final question = questionsList[questionIndex];
      }
    });
    selectedAnswerIndex = null;
  }

  @override
  Widget build(BuildContext context) {
    final question = questionsList[questionIndex];
    return Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            widget.title.toString(),
            style: TextStyle(color: Colors.black),
          ),
        ),
        body:
            // FutureBuilder<List<QuizQuestionModel>>(future: questionsFuture, builder: (context,snapshot){
            //   if (snapshot.connectionState == ConnectionState.waiting) {
            //     return Center(child: CircularProgressIndicator());
            //   } else if (snapshot.hasError) {
            //     return Center(child: Text('Error: ${snapshot.error}'));
            //   } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            //     return Center(child: Text('No questions available'));
            //   }
            //
            //   final questionsList = snapshot.data!;
            //   final question = questionsList[questionIndex];
            //
            //   return
            Padding(
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
                      "${questionIndex + 1}/${questionsList.length}",
                      // Update this to display the current question number
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
                              pickAnswer(index);
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
                      onPressed: selectedAnswerIndex != null
                          ? goToNextQuestion
                          : null),
              // SizedBox(
              //   height: 5,
              // ),
              if (isLastQuestion)
                RectangularButton(
                    label: "More Question",
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Development in progress...")),
                      );
                    })
            ],
          ),
        ));
  }
}
