import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mcqproject/screen/quiz_progress_screen.dart';
import 'package:mcqproject/screen/quize_screen.dart';

class ProgramListScreen extends StatelessWidget {
  const ProgramListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "LearnWinc.com",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 35,
                      ),
                      Icon(
                        Icons.share,
                        color: Colors.white,
                        size: 30,
                      ),
                      Icon(
                        Icons.diamond,
                        color: Colors.white,
                        size: 30,
                      )
                    ],
                  )
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => QuizeScreen(
                            title: "Quize",
                          ));
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Basic SQL Quiz",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                            Text("Contains ad.",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white)),
                            Text("Total - 200",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                  GestureDetector(
                    onTap: (){
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        SnackBar(content: Text('This is premium quiz')),
                      );
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Advance SQL Quiz-",
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            Text("Total -600 Questions including ad.",
                                style:
                                    TextStyle(fontSize: 20, color: Colors.white)),
                            Text("Data Analysis.",
                                style:
                                    TextStyle(fontSize: 20, color: Colors.white)),
                            Text("Performance tuning.",
                                style:
                                    TextStyle(fontSize: 20, color: Colors.white)),
                            Text("Complete SQL and more.",
                                style:
                                    TextStyle(fontSize: 20, color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                  GestureDetector(
                    onTap: (){
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        SnackBar(content: Text('Work in progress.....')),
                      );
                    },
                    child: GestureDetector(
                      onTap: (){
                        // Get.to(()=>QuizProgressScreen());
                      },
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * 0.09,
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Track your progress",
                                  style:
                                      TextStyle(fontSize: 20, color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
