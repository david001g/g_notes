import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_notes/src/features/notes/view/bloc/notes_cubit.dart';
import 'package:g_notes/src/features/notes/view/bloc/pagination_cubit.dart';
import 'package:g_notes/src/features/notes/view/widgets/note_home/note_card/note_card_list.dart';
import 'package:g_notes/src/features/notes/view/widgets/note_home/query_bar/query_bar.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<NotesCubit>().getNotes();
    final int totalNotes = context.read<NotesCubit>().notesCount;
    context.read<PaginationCubit>().setTotalPage((totalNotes / 4).ceil());
    return const Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          QueryBar(),
          NoteCardList(),
          //PaginationBar(),
        ],
      ),
    );
  }
}
