import 'package:flutter/material.dart';
import 'package:memory_game/board_card.dart';
import 'package:memory_game/data/images.dart';

class Board extends StatefulWidget {
  Board({
    super.key,
    required this.incrementScore,
    required this.startTimer,
    required this.stopTimer,
  });

  @override
  State<Board> createState() => _BoardState();

  void Function() startTimer;
  void Function() stopTimer;
  void Function() incrementScore;
}

class _BoardState extends State<Board> {
  List<String> cards = [];
  List<int> activeCards = [];
  List<String> openCards = [];
  final cardsNo = 4;
  bool userStarted = false;

  @override
  void initState() {
    super.initState();
    cards = [...cardOpenImages];
    cards.shuffle();
    cards = cards.sublist(0, 4);
    cards = [...cards, ...cards];
    cards.shuffle();
  }

  void openCard(int idx) {
    if (!userStarted) widget.startTimer();
    userStarted = true;

    setState(() {
      activeCards.add(idx);
      if (activeCards.length == 2) {
        String fstCard = cards[activeCards[0]];
        String sndCard = cards[activeCards[1]];
        if (fstCard.compareTo(sndCard) == 0) {
          openCards.add(fstCard);
          widget.incrementScore();
          if (openCards.length == 4) widget.stopTimer();
        }
        Future.delayed(
          const Duration(seconds: 1),
          () {
            setState(() {
              activeCards.removeAt(0);
              activeCards.removeAt(0);
            });
          },
        );
      }
    });
  }

  bool isCardOpen(int idx, String name) {
    return activeCards.contains(idx) || openCards.contains(name);
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
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              for (final (idx, card) in cards.indexed)
                BoardCard(
                  idx,
                  card,
                  open: openCard,
                  isOpen: isCardOpen,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
