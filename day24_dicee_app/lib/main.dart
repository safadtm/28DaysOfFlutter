import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DicePage(),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  void changeDiceface() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Dice",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        )),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: changeDiceface,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset("images/dice$leftDiceNumber.png"),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: changeDiceface,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset("images/dice$rightDiceNumber.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
