import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<String> chosenAnswers;
  final VoidCallback onRestart;

  @override
  Widget build(BuildContext context) {
    final correctCount = chosenAnswers.asMap().entries.where((entry) {
      return entry.value == questions[entry.key].answers.first;
    }).length;
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Quiz Results',
                  textAlign: TextAlign.center,
                  style: textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'You answered $correctCount out of ${questions.length} '
                  'questions correctly.',
                  textAlign: TextAlign.center,
                  style: textTheme.bodyLarge?.copyWith(color: Colors.white70),
                ),
                const SizedBox(height: 20),
                Flexible(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: chosenAnswers.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final question = questions[index];
                      return _AnswerReview(
                        number: index + 1,
                        question: question.text,
                        submittedAnswer: chosenAnswers[index],
                        correctAnswer: question.answers.first,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  onPressed: onRestart,
                  style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
                  icon: const Icon(Icons.restart_alt),
                  label: const Text('Restart Quiz'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AnswerReview extends StatelessWidget {
  const _AnswerReview({
    required this.number,
    required this.question,
    required this.submittedAnswer,
    required this.correctAnswer,
  });

  final int number;
  final String question;
  final String submittedAnswer;
  final String correctAnswer;

  @override
  Widget build(BuildContext context) {
    final isCorrect = submittedAnswer == correctAnswer;
    const green = Color(0xFFA5D6A7);
    const red = Color(0xFFEF9A9A);
    final statusColor = isCorrect ? green : red;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Semantics(
              label: 'Question $number, ${isCorrect ? 'correct' : 'incorrect'}',
              excludeSemantics: true,
              child: CircleAvatar(
                radius: 16,
                backgroundColor: statusColor,
                foregroundColor: Colors.black,
                child: Text('$number'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    question,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Your answer: $submittedAnswer',
                    style: TextStyle(color: isCorrect ? Colors.white70 : red),
                  ),
                  Text(
                    'Correct answer: $correctAnswer',
                    style: const TextStyle(color: green),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
