import 'package:flutter/material.dart';
import 'package:mcqproject/models/questions_model.dart';
import 'package:mcqproject/sqflite/database_manager.dart';

class ResultAttempQuestion extends StatefulWidget {
  const ResultAttempQuestion({super.key});

  @override
  State<ResultAttempQuestion> createState() => _ResultAttempQuestionState();
}

class _ResultAttempQuestionState extends State<ResultAttempQuestion> {
  // @override
  // void initState() {
  //   DatabaseHelper.getQuestions();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<QuestionModel>>(
            future: DatabaseHelper.getQuestions(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              final questions = snapshot.data;

              if (questions == null || questions.isEmpty) {
                return Center(child: Text('No questions found.'));
              }
              return ListView.builder(
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    // final q = questions[index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "your Result",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Attempt - 1",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Text("Your scored 0 out of 5.",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Percentage : 0.00%",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  Text("Date -09-March-2025",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text("Fail",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }));
  }
}
