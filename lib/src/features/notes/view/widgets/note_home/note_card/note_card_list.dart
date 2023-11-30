import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_notes/src/common/loading_indicator.dart';
import 'package:g_notes/src/features/notes/view/bloc/notes_cubit.dart';
import 'package:g_notes/src/common/empty_indicator.dart';
import 'package:g_notes/src/features/notes/view/widgets/note_home/note_card/note_card.dart';

class NoteCardList extends StatelessWidget {

  const NoteCardList({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 850.w,
      child: BlocBuilder<NotesCubit,NotesState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case NoteInitial:
              return const Text('Initial State');
            case NoteLoading:
              return const LoadingIndicator();
            case NoteEmpty:
              return const EmptyIndicator(width: 500, height: 500);
            case NoteDone:
              return SizedBox(
                height: 680.h,
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: state.notes!.length,
                    itemBuilder: (context, index) {
                      return NoteCard(
                        note: state.notes![index]!,
                      );
                    },
                  ),
                ),
              );
            case NoteError:
              return Text(state.message!);
            default:
              return const Text('Other State');
          }
        },
      ),
    );
  }
}
