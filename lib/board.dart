import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/data/images.dart';

class Board extends StatefulWidget {
  Board({super.key});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  List<String> cards = [];
  List<int> activeCards = [];
  List<String> openCards = [];
  final cardsNo = 4;

  @override
  void initState() {
    super.initState();
    cards = [...cardOpenImages];
    cards.shuffle();
    cards = cards.sublist(0, 4);
    cards = [...cards, ...cards];
    cards.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(48),
      child: Center(
        child: SizedBox(
          width: 800,
          child: GridView.count(
            mainAxisSpacing: 48,
            crossAxisSpacing: 48,
            crossAxisCount: 4,
            children: [
              for (final (idx, card) in cards.indexed)
                InkWell(
                  onTap: () {
                    print("Press me harder! $idx");

                    setState(() {
                      activeCards.add(idx);
                      if (activeCards.length == 2) {
                        String fstCard = cards[activeCards[0]];
                        String secCard = cards[activeCards[1]];
                        if (fstCard.compareTo(secCard) == 0) {
                          openCards.add(fstCard);
                          print("OpenCards: $openCards");
                        }
                        var future = Future.delayed(
                          const Duration(seconds: 1),
                          () {
                            setState(() {
                              activeCards.clear();
                            });
                          },
                        );
                      }
                    });
                  },
                  child: Ink(
                    height: 48,
                    decoration: BoxDecoration(
                      border: const Border(
                        left: BorderSide(color: Colors.blue, width: 4),
                        right: BorderSide(color: Colors.blue, width: 4),
                        top: BorderSide(color: Colors.blue, width: 4),
                        bottom: BorderSide(color: Colors.blue, width: 4),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Colors.deepPurple.shade400,
                          Colors.deepPurple.shade900,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Image.asset(
                      activeCards.indexOf(idx) > -1 ||
                              openCards.indexOf(card) > -1
                          ? "assets/images/$card"
                          : "assets/images/question.png",
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
