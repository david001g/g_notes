import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_notes/src/common/basic_button.dart';
import 'package:g_notes/src/config/router/router.dart';
import 'package:g_notes/src/config/themes/font_themes.dart';
import 'package:g_notes/src/core/constants/colors.dart';
import 'package:g_notes/src/features/authentication/view/bloc/authentication_cubit.dart';
import 'package:g_notes/src/features/notes/domain/entities/note.dart';
import 'package:g_notes/src/features/notes/view/bloc/notes_cubit.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class NoteDetails extends StatelessWidget {
  final NoteEntity note;

  const NoteDetails({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StatusBar(
          note: note,
        ),
        const Spacer(),
        BasicButton(
            color: primaryPurple,
            text: 'READ',
            onPressed: () =>
                context.pushNamed(AppRoute.updateNote.name, extra: note),
            height: 30.h,
            width: 90.w),
        Gap(10.w),
        BasicButton(
            color: primaryRed,
            text: 'DELETE',
            onPressed: () => context.read<NotesCubit>().deleteNote(note.id!),
            height: 30.h,
            width: 90.w),
      ],
    );
  }
}

class StatusBar extends StatelessWidget {
  final NoteEntity note;

  const StatusBar({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    String name = context.read<AuthenticationCubit>().user!.name!;
    return Container(
        height: 40.h,
        width: 330.w,
        decoration: BoxDecoration(
          color: primarySecondaryPurple,
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(name, style: Theme.of(context).textTheme.bodyB12),
            Text(note.updatedAt.toString(),
                style: Theme.of(context).textTheme.dateStyle),
            Text(note.category ?? "No Category",
                style: Theme.of(context).textTheme.categoryStyle),
          ],
        ));
  }
}
