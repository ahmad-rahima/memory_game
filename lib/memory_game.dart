import 'package:flutter/material.dart';
import 'package:memory_game/game.dart';
import 'package:memory_game/game_menu.dart';

class MemoryGame extends StatefulWidget {
  const MemoryGame({super.key});

  @override
  State<StatefulWidget> createState() => _MemoryGameState();
}

class _MemoryGameState extends State {
  String activeView = 'game_menu';

  void setActiveView(String view) {
    setState(() {
      activeView = view;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (activeView) {
      case 'game:4':
        return const Game(cardsNo: 4);
      case 'game:8':
        return const Game(cardsNo: 8);
      case 'game:16':
        return const Game(cardsNo: 16);
      case 'game_menu':
      default:
        return GameMenu(setActiveView);
    }
  }
}
