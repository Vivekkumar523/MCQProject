import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizCard extends StatelessWidget {
  String ?quizTitle;
  String ?questionAttemped;
  String? questionRemaining;
   QuizCard({super.key,this.quizTitle,this.questionAttemped,this.questionRemaining});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.30,
      width: double.infinity,
      child: Card(
        elevation: 3,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                quizTitle.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(questionAttemped.toString(),
                  style: TextStyle(
                    fontSize: 18,
                  )),
              Text(questionRemaining.toString(),
                  style: TextStyle(
                    fontSize: 18,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.06,
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5)),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text("Download Certificate",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
