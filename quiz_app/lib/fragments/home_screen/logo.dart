import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    this.width,
    super.key,
  });

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: Image.asset(
        'assets/images/quiz-logo.png',
        color: const Color.fromRGBO(255, 255, 255, 0.60),
        width: width,
      ),
    );
  }
}
