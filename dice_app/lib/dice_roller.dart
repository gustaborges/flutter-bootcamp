import 'dart:math';

import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  final Random randomizer = Random();
  int activeDiceFace = 1;

  void rollDice() {
    setState(() {
      activeDiceFace = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-$activeDiceFace.png',
          width: 200,
        ),
        const SizedBox(
          // This is an alternative to padding :)
          height: 25,
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle:
                const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          child: const Text('Roll dice'),
        ),
      ],
    );
  } // _ sets class as private
}
