import 'package:day27_flutter_polls/polls_view.dart';
import 'package:flutter/material.dart';

class PollsPage extends StatelessWidget {
  const PollsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: PollsView(
          question: "Would you like to do more than one job?",
          options: [
            "Already doing it",
            "Yes, if it pays me 2X",
            "No, why would I?",
          ],
        ),
      ),
    );
  }
}
