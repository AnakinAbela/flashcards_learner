import 'package:flutter/material.dart';

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

class FlashcardViewerScreen extends StatelessWidget {
  const FlashcardViewerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Flashcards Learner'),
      ),
    );
  }
}
