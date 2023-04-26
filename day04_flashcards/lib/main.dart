import 'package:day04_flashcards/flash_card_view.dart';
import 'package:day04_flashcards/flash_text.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<FlashText> _flashText = [
    FlashText("What programming language does Flutter use?", "Dart"),
    FlashText("What is Flutter?",
        "Flutter is a mobile development framework developed by Google"),
    FlashText("What is a widget in Flutter?",
        "In Flutter, a widget is a building block of the user interface, such as a button or text box."),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 250,
                width: 250,
                child: FlipCard(
                  front:
                      FlashCardView(text: _flashText[_currentIndex].question),
                  back: FlashCardView(
                    text: _flashText[_currentIndex].answer,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton.icon(
                    onPressed: showPrevCard,
                    icon: const Icon(Icons.chevron_left),
                    label: const Text("PREV"),
                  ),
                  OutlinedButton.icon(
                    onPressed: showNextCard,
                    icon: const Icon(Icons.chevron_right),
                    label: const Text("NEXT"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void showPrevCard() {
    setState(() {
      _currentIndex = (_currentIndex - 1) % _flashText.length;
    });
  }

  void showNextCard() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _flashText.length;
    });
  }
}
