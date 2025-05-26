import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    // currentQuestionIndex = currentQuestionIndex + 1;
    // currentQuestionIndex += 1;

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 229, 227, 250),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(),
            //   onPressed: (){},
            //   child: Text('Answer 1'),
            // ),
            ...currentQuestion.getShuffledAnswers().map((item) {
              return AnswerButton(
                answerText: item,
                onTap: () {
                  answerQuestion(item);
                },
              );
            }),
            // AnswerButton(answerText: currentQuestion.answers[0], onTap: () {}),
            // AnswerButton(answerText: currentQuestion.answers[1], onTap: () {}),
            // AnswerButton(answerText: currentQuestion.answers[2], onTap: () {}),
            // AnswerButton(answerText: currentQuestion.answers[3], onTap: () {}),
          ],
        ),
      ),
    );
  }
}
