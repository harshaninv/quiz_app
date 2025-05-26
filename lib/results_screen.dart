import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';
import 'package:quiz_app/utils/test_theme.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.restartQuiz, {super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
        'iscorrect' : questions[i].answers[0] == chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numberTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered $numCorrectQuestions out of $numberTotalQuestions questions correctly', style: CustomTestStyle().headline, textAlign: TextAlign.center,),
            SizedBox(height: 30),
            // Text('List of answers and questions...'),
            QuestionSummary(summaryData),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: restartQuiz,
              icon: const Icon(Icons.refresh, color: Color.fromARGB(255, 185, 191, 224), size: 25,),
              label: const Text('Restart Quiz!', style: TextStyle(color: Color.fromARGB(255, 185, 191, 224)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
