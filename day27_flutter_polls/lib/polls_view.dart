import 'package:flutter/material.dart';

bool userTap = false;

class PollsView extends StatefulWidget {
  final String question;
  final List<String> options;

  const PollsView({
    Key? key,
    required this.question,
    required this.options,
  }) : super(key: key);

  @override
  State<PollsView> createState() => _PollsViewState();
}

class _PollsViewState extends State<PollsView> {
  int _option1Count = 3;
  int _option2Count = 1;
  int _option3Count = 2;

  void _voteOption1() {
    if (!userTap) {
      setState(() {
        userTap = !userTap;
        _option1Count++;
      });
    }
  }

  void _voteOption2() {
    if (!userTap) {
      setState(() {
        userTap = !userTap;
        _option2Count++;
      });
    }
  }

  void _voteOption3() {
    if (!userTap) {
      setState(() {
        userTap = !userTap;
        _option3Count++;
      });
    }
  }

  void _onUndoPressed() {
    if (userTap) {
      setState(() {
        userTap = false;
        if (_option1Count > 0) {
          _option1Count--;
        } else if (_option2Count > 0) {
          _option2Count--;
        } else if (_option3Count > 0) {
          _option3Count--;
        }
      });
    }
  }

  int _calculatePercentage(int voteCount, int totalCount) {
    if (totalCount == 0) {
      return 0;
    }
    double percentage = (voteCount / totalCount) * 100;
    return percentage.round();
  }

  @override
  Widget build(BuildContext context) {
    int totalCount = _option1Count + _option2Count + _option3Count;

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.amber),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.question,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 20),
            optionButton(
              option: widget.options[0],
              onPressed: _voteOption1,
              optionCount: _option1Count,
              totalCount: totalCount,
            ),
            const SizedBox(height: 15),
            optionButton(
              option: widget.options[1],
              onPressed: _voteOption2,
              optionCount: _option2Count,
              totalCount: totalCount,
            ),
            const SizedBox(height: 15),
            optionButton(
              option: widget.options[2],
              onPressed: _voteOption3,
              optionCount: _option3Count,
              totalCount: totalCount,
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: _onUndoPressed,
                style: const ButtonStyle(enableFeedback: false),
                child: Text(
                  "Undo",
                  style: TextStyle(
                      color: userTap ? Colors.blue : Colors.grey, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget optionButton({
    required String option,
    required VoidCallback onPressed,
    required int optionCount,
    required int totalCount,
  }) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: userTap
                ? Border.all(color: Colors.grey, width: 2.0)
                : Border.all(color: Colors.blue, width: 2.0),
            borderRadius:
                userTap ? BorderRadius.circular(0) : BorderRadius.circular(40),
            // color: Colors.green,
          ),
          child: OutlinedButton(
            style: ButtonStyle(
              enableFeedback: false,
              side: MaterialStateProperty.all(BorderSide.none),
            ),
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: userTap
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              children: [
                Text(
                  option,
                  style: TextStyle(
                    color: userTap ? Colors.grey : Colors.blue,
                    fontSize: userTap ? 15 : 20,
                  ),
                ),
                Visibility(
                  visible: userTap,
                  child: Text(
                    "${_calculatePercentage(optionCount, totalCount)}%",
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
