import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_notes/src/config/router/router.dart';
import 'package:g_notes/src/config/themes/font_themes.dart';
import 'package:g_notes/src/core/constants/colors.dart';
import 'package:g_notes/src/features/categories/domain/entities/category.dart';
import 'package:g_notes/src/features/categories/view/bloc/category_cubit.dart';
import 'package:g_notes/src/features/notes/domain/entities/note.dart';
import 'package:g_notes/src/features/notes/view/bloc/notes_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

class SubmitButton extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  final QuillController controller;
  final bool isUpdate;
  NoteEntity? note;

  SubmitButton({
    super.key,
    required this.formKey,
    required this.controller,
    required this.isUpdate,
    this.note,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: isUpdate ? primaryGreen : primaryPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            print(formKey.currentState!.value);
            isUpdate ? updateNote(context, note!) : createNote(context);
            context.goNamed(AppRoute.notes.name);
          } else {
            print(formKey.currentState!.value);
            print('validation failed');
          }

        },
        child: Center(
          child: Text(
            isUpdate ? 'Update Note' : 'Create Note',
            style: Theme.of(context).textTheme.bodyB10White,
          ),
        ),
      ),
    );
  }

  void createNote(BuildContext context) async{
    formKey.currentState?.saveAndValidate();

    var categoryId = formKey.currentState!.value['category'];
    CategoryEntity? category = categoryId == null ? null : await context.read<CategoryCubit>().getCategory(categoryId) ;
    String content = jsonEncode(controller.document.toDelta().toJson());
    String? currentUserId = FirebaseAuth.instance.currentUser!.uid;

    NoteEntity note = NoteEntity(
      id: const Uuid().v4(),
      userId: currentUserId,
      categoryId: categoryId,
      title: formKey.currentState!.value['title'],
      category: category?.name,
      content: content,
    );
    context.read<NotesCubit>().createNote(note);
  }

   updateNote(BuildContext context, note) async{
    try {
      if (!formKey.currentState!.saveAndValidate()) return;

      var categoryId = formKey.currentState!.value['category'];
      CategoryEntity? category = categoryId != null ? await context.read<
          CategoryCubit>().getCategory(categoryId) : null;
      String content = jsonEncode(controller.document.toDelta().toJson());

      NoteEntity updateNote = NoteEntity(
        id: note.id,
        userId: note.userId,
        categoryId: categoryId,
        title: formKey.currentState!.value['title'],
        category: category?.name,
        content: content,
        createdAt: note.createdAt,
      );

      context.read<NotesCubit>().updateNote(updateNote);
    }
    catch(e){
      print(e);
    }
  }
}
