import 'package:flutter/material.dart';

class BoardCard extends StatelessWidget {
  BoardCard(this.index, this.cardName,
      {super.key, required this.open, required this.isOpen});

  int index;
  String cardName;
  void Function(int) open;
  bool Function(int, String) isOpen;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        open(index);
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
          isOpen(index, cardName)
              ? "assets/images/$cardName"
              : "assets/images/question.png",
        ),
      ),
    );
  }
}
