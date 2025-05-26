import 'package:flutter/material.dart';
import 'package:quiz_app/utils/test_theme.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children:
              summaryData.map((data) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: data['iscorrect'] as bool 
                            ? Color.fromARGB(255, 114, 217, 235) 
                            : const Color.fromARGB(255, 238, 126, 163),
                        shape: BoxShape.circle

                      ),
                      alignment: Alignment.center,
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(), 
                        style: CustomTestStyle().indexNumber
                      )
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        // question text
                        Text(data['question'] as String, style: CustomTestStyle().questionText,),
                        SizedBox(height: 5,),
                        // User answer
                        Text(data['user_answer'] as String, style: CustomTestStyle().userAnswer,),
                        SizedBox(height: 5,),
                        // Correct answer
                        Text(data['correct_answer'] as String, style: CustomTestStyle().correctAnswer,),
                      
                      ],),
                    )
                  ],
                );
              }).toList(),
        ),
      ),
    );
  }
}
