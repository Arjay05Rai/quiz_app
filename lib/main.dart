//main
import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 7, 7, 7),
                Color.fromARGB(255, 37, 37, 37),
              ],
            ),
          ),
          child: Quiz(),
        ),
      ),
    ),
  );
}