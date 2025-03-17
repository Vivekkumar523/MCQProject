import 'package:flutter/material.dart';
import 'package:mcqproject/widget/quiz_card.dart';

class QuizProgressScreen extends StatelessWidget {
  const QuizProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1,
            ),
            QuizCard(
              quizTitle: "Quiz Progress",
              questionAttemped: "Questions Attempted",
              questionRemaining: "Questions Remaining",
            )
          ],
        ),
      ),
    );
  }
}
