import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min,
      children: [

        Image.asset('assets/images/quiz-logo.png',
        width: 300,
        color: const Color.fromARGB(255, 233, 230, 230)),
        const SizedBox(height: 20),
        const Text(
          "Take the quiz and challenge your knowledge",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        OutlinedButton.icon(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white),
          icon:Icon(Icons.arrow_right_alt_rounded),
          label: const Text("Start Quiz"),
        ),
      ]
      )
    );
  }
}