import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_notes/src/features/notes/domain/entities/note.dart';
import 'package:g_notes/src/features/notes/view/widgets/note_home/note_card/components/note_details.dart';
import 'package:g_notes/src/features/notes/view/widgets/note_home/note_card/components/note_pre_content.dart';
import 'package:g_notes/src/features/notes/view/widgets/note_home/note_card/components/note_title.dart';

class NoteCard extends StatelessWidget {
  final NoteEntity note;
  const NoteCard({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
        margin: EdgeInsets.symmetric( vertical: 10.h),
        height: 130.h,
        width: 850.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20.r),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NoteTitle(text: note.title ?? ""),
            NotePreContent(text: note.category ?? "No Category"),
            NoteDetails(note: note),
          ],
        ));
  }
}




