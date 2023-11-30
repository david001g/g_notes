import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:g_notes/src/features/notes/domain/entities/note.dart';
import 'package:g_notes/src/features/notes/view/widgets/create_note/components/category_field.dart';
import 'package:g_notes/src/features/notes/view/widgets/create_note/components/content_field.dart';
import 'package:g_notes/src/features/notes/view/widgets/create_note/components/submit_button.dart';
import 'package:g_notes/src/features/notes/view/widgets/create_note/components/title_field.dart';
import 'package:g_notes/src/features/notes/view/widgets/create_note/components/title_label.dart';

class CreateNotePage extends StatelessWidget {
  NoteEntity? note;

  CreateNotePage({
    super.key,
    this.note,
  });

  @override
  Widget build(BuildContext context) {
    var myJSON = note?.content != null
        ? jsonDecode(note!.content!)
        : [
            {"insert": "\n"}
          ];
    QuillController controller = QuillController(
        document: Document.fromJson(myJSON),
        selection: const TextSelection.collapsed(offset: 0));
    final formKey = GlobalKey<FormBuilderState>();
    return Container(
      width: 650.w,
      height: 719.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: FormBuilder(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleLabel(),
              TitleField(title: note?.title),
              const CategoryField(),
              ContentField(controller: controller),
              SubmitButton(
                formKey: formKey,
                controller: controller,
                isUpdate: note != null,
                note: note,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
