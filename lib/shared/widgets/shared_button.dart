import 'package:flutter/material.dart';

class SharedButton extends StatelessWidget {
  final String button_text;
  final VoidCallback onPressed;
  final Color bg_color;
  final Color text_color;
  final double size;

  const SharedButton({
    super.key,
    required this.button_text,
    required this.onPressed,
    required this.bg_color,
    this.text_color = Colors.black,
    this.size = 30.0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bg_color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size, vertical: 15),
        child: Text(button_text,
            style: TextStyle(
                color: text_color, fontWeight: FontWeight.bold) // Text color
            ),
      ),
    );
  }
}
