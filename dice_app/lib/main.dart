import 'package:flutter/material.dart';

import 'dice_roller.dart';

void main() {
  runApp(const MaterialApp(
    home: DiceView(),
  ));
}

class DiceView extends StatelessWidget {
  const DiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 67, 0, 133),
              Color.fromARGB(255, 101, 4, 186)
            ],
          ),
        ),
        child: const Center(child: DiceRoller()),
      ),
    );
  }
}
