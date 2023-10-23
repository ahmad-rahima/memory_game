import 'package:flutter/material.dart';

class Game extends StatelessWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 48,
      crossAxisSpacing: 48,
      crossAxisCount: 3,
      children: [
        for (var i in [1, 2, 3, 4, 5, 6, 7, 8, 9])
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.deepPurple.shade400,
                  Colors.deepPurple.shade900,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Text(
              "$i",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 80,
              ),
            ),
          ),
      ],
    );
  }
}
