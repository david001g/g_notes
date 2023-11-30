import 'package:flutter/material.dart';
import 'package:g_notes/src/config/themes/font_themes.dart';

class NotePreContent extends StatelessWidget {
  final String text;

  const NotePreContent({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.body10,
        ),
      ],
    );
  }
}
