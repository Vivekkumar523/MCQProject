import 'package:flutter/material.dart';

class ProgramListScreen extends StatelessWidget {
  const ProgramListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(10)),
            child: Column(children: [
              Text("Basic SQL Quiz"),
              Text("Contains ad."),
              Text("Total - 200"),
            ],),
          )
        ],
      ),
    );
  }
}
