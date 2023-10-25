import 'dart:async';
import 'package:flutter/material.dart';
import 'package:memory_game/board.dart';

class Game extends StatefulWidget {
  const Game({super.key, required this.cardsNo});

  @override
  State<Game> createState() => _GameState();

  final int cardsNo;
}

class _GameState extends State<Game> {
  int score = 0;
  int seconds = 0;
  Timer? timer;

  String _printDuration(Duration duration) {
    String negativeSign = duration.isNegative ? '-' : '';
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60).abs());
    String twoDigitSeconds =
        twoDigits(duration.inSeconds.remainder(60).abs().toInt());
    return "$negativeSign${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void initState() {
    super.initState();
  }

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          ++seconds;
        });
      },
    );
  }

  void stopTimer() {
    if (timer != null) {
      timer?.cancel();
    }
  }

  void incScore() {
    setState(() {
      ++score;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Score: $score | "
          "Time: ${_printDuration(Duration(seconds: seconds))}",
          // "Time: $time",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 60,
          ),
        ),
        Board(
          incrementScore: incScore,
          startTimer: startTimer,
          stopTimer: stopTimer,
          cardsNo: widget.cardsNo,
        ),
      ],
    );
  }
}
