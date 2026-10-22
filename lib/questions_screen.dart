 import 'package:flutter/material.dart';
 import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key,required this.onSelectedAnswer});
    final void Function(String) onSelectedAnswer;


  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String answer) {
    widget.onSelectedAnswer(answer);
  setState(() {
    currentQuestionIndex++;
  });
}





  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Center(
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.roboto(color: Colors.white, fontSize: 20, 
              fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((item) {
              return AnswerButton(
                answerText: item,
                onTap: () {
                  answerQuestion(item);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}


