import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mcqproject/controller/quize_controller.dart';

class AnswerCard extends StatelessWidget {
  int currectIndex;
  final String question;
  bool isSelected;
  int correctAnswerIndex;
  int selectedAnswerIndex;

  AnswerCard({
    super.key,
    required this.currectIndex,
    required this.question,
    required this.isSelected,
    required this.correctAnswerIndex,
    required this.selectedAnswerIndex,
  });

  @override
  Widget build(BuildContext context) {
    bool isCorrectAnswer = currectIndex == correctAnswerIndex;
    bool isWrongAnswer = !isCorrectAnswer && isSelected;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: selectedAnswerIndex != -1
          ? Container(
              height: 50,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                      width: 2,
                      color: isCorrectAnswer
                          ? Colors.green
                          : isWrongAnswer
                              ? Colors.red
                              : Colors.white)),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      question,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  isCorrectAnswer
                      ? buildCorrectIcon()
                      : isWrongAnswer
                          ? buildWrongIcon()
                          : SizedBox()
                ],
              ),
            )
          : Container(
              height: 50,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(width: 2, color: Colors.white)),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    question,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
    );
  }
}

Widget buildCorrectIcon() => CircleAvatar(
      backgroundColor: Colors.green,
      radius: 15,
      child: Icon(
        Icons.check,
        color: Colors.white,
      ),
    );

Widget buildWrongIcon() => CircleAvatar(
      backgroundColor: Colors.red,
      radius: 15,
      child: Icon(
        Icons.close,
        color: Colors.white,
      ),
    );
