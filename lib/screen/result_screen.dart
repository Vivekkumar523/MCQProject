import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcqproject/models/questions_model.dart';
import 'package:mcqproject/screen/quize_screen.dart';

import '../widget/next_button.dart';

class ResultScreen extends StatelessWidget {
  int score;
  ResultScreen({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "Your Score",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 250,
                  width: 250,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    value: score / questionsList.length,
                    color: Colors.blue,
                    backgroundColor: Colors.white,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "${score.toString()}/ ${questionsList.length}",
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${(score / questionsList.length * 100).round()}%",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            RectangularButton(
              label: "Back To Quize",
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (_) => QuizeScreen(
                          title: "MCQ Questions",
                        )));
              },
            )
          ],
        ),
      ),
    );
  }
}
