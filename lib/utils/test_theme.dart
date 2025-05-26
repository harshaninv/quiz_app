import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class CustomTestStyle {
  final headline = GoogleFonts.lato(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: const Color.fromARGB(255, 192, 193, 250),
  );

  final indexNumber = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w900,
    color: const Color.fromARGB(255, 18, 26, 134),
  );

  final questionText = GoogleFonts.lato(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  final userAnswer = GoogleFonts.lato(
    fontSize: 14,
    color: const Color.fromARGB(255, 155, 171, 185),
    fontWeight: FontWeight.w500,
  );

  final correctAnswer = GoogleFonts.lato(
    fontSize: 14,
    color: const Color.fromARGB(255, 114, 239, 243),
    fontWeight: FontWeight.w500,
  );
}
