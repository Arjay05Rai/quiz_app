import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  const AnswerButton(
    {
      required this.answerText,
      required this.onTap, 
      super.key
    }
  );
   
  final String answerText;
  final void Function() onTap;

  @override
  Widget build(context){
    return 
    ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      backgroundColor: const Color.fromARGB(255, 50, 45, 45),
      foregroundColor: Colors.white,
      ),

      child: Text(answerText),
    );
  }
}