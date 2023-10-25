import 'package:flutter/material.dart';

class GameMenu extends StatelessWidget {
  GameMenu(this.selectActiveView, {super.key});

  void Function(String) selectActiveView;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: SizedBox(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final cardOpt in [4, 8, 16])
                Container(
                  margin: const EdgeInsets.all(4),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      selectActiveView('game:$cardOpt');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                    ),
                    child: Text(
                      "$cardOpt Cards",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
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
