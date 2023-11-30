import 'package:flutter/material.dart';
import 'package:g_notes/src/config/themes/font_themes.dart';

class QueryItem extends StatelessWidget {
  final String title;
  final bool active;

  const QueryItem({
    super.key,
    required this.active,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('tap');
        //TODO: query
      },
      child: Text(
        title,
        style: active
            ? Theme.of(context).textTheme.bodyB14White
            : Theme.of(context).textTheme.bodyB14Grey,
      ),
    );
  }
}
