import 'package:flutter/material.dart';
import 'package:g_notes/src/config/themes/font_themes.dart';

class TitleLabel extends StatelessWidget {
  const TitleLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Create Note',
      style: Theme.of(context).textTheme.bodyB20,
    );
  }
}
