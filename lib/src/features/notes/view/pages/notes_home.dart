import 'package:flutter/material.dart';
import 'package:g_notes/src/config/router/router.dart';
import 'package:g_notes/src/core/constants/images.dart';
import 'package:g_notes/src/core/layout/LayoutTemplate.dart';
import 'package:g_notes/src/features/notes/view/widgets/note_home/notes_page.dart';
import 'package:go_router/go_router.dart';

class NotesHome extends StatelessWidget {
  const NotesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutTemplate(
        route: AppRoute.notes,
        topButtonTitle: 'Create Note',
        topButtonIcon: writeIcon,
        topNavigation: () => context.pushNamed(AppRoute.createNote.name),
        child: const NotesPage());
  }
}
