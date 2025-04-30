import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mcqproject/models/questions_model.dart';
import 'package:mcqproject/screen/pdf_certificate.dart';
import 'package:mcqproject/screen/quiz_screen.dart';
import 'package:mcqproject/screen/result_attemp_question.dart';

import '../widget/next_button.dart';

class ResultScreen extends StatelessWidget {
  int score;
  ResultScreen({super.key, required this.score});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Padding(
          padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                child: Container(
                  width: double.infinity,
                  child: Card(
                    elevation: 4,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "Quiz Progress",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Question  attempted: ${score.toString()}",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Question Remaining: --",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        RectangularButton(
                          label: "Download Certificate",
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) =>Certificate()));
                          },
                        ),

                      ],
                    ),
                  ),
                )
            ),
            SizedBox(height: 10),
            Expanded(
                child: Container(
                  width: double.infinity,
                    child: Card(
                      elevation: 4,
                      child: Column(
                        children: [
                          SizedBox(height: 50),
                          Text(
                            "Your Result",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Your Scored ${score.toString()} out of ${questionsList.length}",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Percentage: ${score.toString()} out of ${questionsList.length}",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Status: ${score.toString()} out of ${questionsList.length}",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Row(
                              children: [
                                Expanded(
                                    child: ElevatedButton(
                                        onPressed: (){
                                          Get.to(ResultAttempQuestion());
                                        },
                                        child: Text("Show Explanation"))
                                ),
                                SizedBox(width: 5,),
                                Expanded(
                                    child: ElevatedButton(
                                        onPressed: (){},
                                        child: Text("Retry Quiz"))
                                ),
                              ],
                          )
                        ],
                      ),
                    ),
                )
            )
          ],
        ),
      ),
    );
  }
}
