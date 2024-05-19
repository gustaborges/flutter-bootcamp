import 'package:flutter/material.dart';

class RectangularButton extends StatelessWidget {
  final String label;
  final Icon icon;
  final Function() onPressed;

  const RectangularButton(
      {super.key,
      required this.label,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: icon,
      label: Text(label),
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(
          width: 1.0,
          color: Color.fromRGBO(255, 255, 255, 0.30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
