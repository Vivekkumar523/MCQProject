import 'package:flutter/material.dart';

class RectangularButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  const RectangularButton(
      {super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: SizedBox(
          height: 50,
          child: Card(
            color: onPressed != null ? Colors.orange.shade600 : Colors.grey,
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
        ));
  }
}
