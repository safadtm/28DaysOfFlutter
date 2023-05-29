import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  void playSound(int voiceNumber) {
    final player = AudioPlayer();
    player.play(AssetSource("note$voiceNumber.wav"));
  }

  Expanded buildKey(
      {required Color color, required int voiceNumber, required String text}) {
    return Expanded(
      child: MaterialButton(
        enableFeedback: false,
        onPressed: () {
          playSound(voiceNumber);
        },
        color: color,
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
              color: Colors.black26),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black12,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildKey(color: Colors.red, voiceNumber: 1, text: 'C'),
            buildKey(color: Colors.orange, voiceNumber: 2, text: 'D'),
            buildKey(color: Colors.yellow, voiceNumber: 3, text: 'E'),
            buildKey(color: Colors.green, voiceNumber: 4, text: 'F'),
            buildKey(color: Colors.teal, voiceNumber: 5, text: 'G'),
            buildKey(color: Colors.blue, voiceNumber: 6, text: 'A'),
            buildKey(color: Colors.purple, voiceNumber: 7, text: 'B'),
          ],
        )),
      ),
    );
  }
}
