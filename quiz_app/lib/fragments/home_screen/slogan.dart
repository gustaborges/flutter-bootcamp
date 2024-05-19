import 'package:flutter/material.dart';

class Slogan extends StatelessWidget {
  const Slogan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Learn Flutter the fun way!',
      style: TextStyle(color: Colors.white, fontSize: 20),
    );
  }
}
