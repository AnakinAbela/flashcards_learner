import 'package:flutter/material.dart';
import 'package:flashcards_learner/widgets/flashcard_viewer_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlashcardViewerScreen(),
    );
  }
}
