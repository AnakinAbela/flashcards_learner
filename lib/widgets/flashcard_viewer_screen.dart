import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'add_flashcard_screen.dart';

class FlashcardViewerScreen extends StatefulWidget {
  const FlashcardViewerScreen({super.key});

  @override
  State<FlashcardViewerScreen> createState() => _FlashcardViewerScreenState();
}

class _FlashcardViewerScreenState extends State<FlashcardViewerScreen> {
  List<Map<String, String>> _cards = [];
  int _currentIndex = 0;
  bool _showTerm = true;

  @override
  void initState() {
    super.initState();
    _loadCards();
  }

  Future<void> _loadCards() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('flashcards') ?? '[]';
    final decoded = jsonDecode(jsonString) as List<dynamic>;
    final cards = decoded
        .map((item) => Map<String, String>.from(item as Map))
        .toList();

    setState(() {
      _cards = cards;
      _currentIndex = 0;
      _showTerm = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final hasCards = _cards.isNotEmpty;
    final cardText = hasCards
        ? (_showTerm
            ? _cards[_currentIndex]['term']
            : _cards[_currentIndex]['definition'])
        : 'No flashcards available';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashcards Learner'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final saved = await Navigator.push<bool>(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddFlashcardScreen(),
                ),
              );
              if (saved == true) {
                _loadCards();
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Text(
            cardText ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
