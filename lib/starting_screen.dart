import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          // Opacity(
          //   opacity: 0.5,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          const SizedBox(height: 80),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(
              color: Color.fromARGB(255, 196, 231, 245),
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            onPressed: startQuiz,
            icon: Icon(Icons.arrow_right_alt_rounded),
            label: Text('Start Quiz!', style: GoogleFonts.lato(),),
          ),
        ],
      ),
    );
  }
}
