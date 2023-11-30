import 'package:flutter/material.dart';
import 'package:g_notes/src/config/themes/font_themes.dart';

class BasicButton extends StatelessWidget {
  final Color color;
  final String text;
  final Function onPressed;
  final double width;
  final double height;

  const BasicButton(
      {super.key,
      required this.color,
      required this.text,
      required this.onPressed,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        fixedSize: Size(width, height),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: () => onPressed(),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyB10White,
      ),
    );
  }
}
