import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/quiz-logo.png'),
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
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white),
          child: const Text("Start Quiz"),
        ),
      ]
      )
    );
  }
}