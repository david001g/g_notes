import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_notes/src/config/router/router.dart';
import 'package:g_notes/src/config/themes/font_themes.dart';
import 'package:g_notes/src/core/constants/colors.dart';
import 'package:g_notes/src/features/categories/domain/entities/category.dart';
import 'package:g_notes/src/features/categories/view/bloc/category_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

class SubmitButton extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  final CategoryEntity? category;
  final bool isEdit;

  const SubmitButton({
    super.key,
    required this.isEdit,
    required this.formKey,
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(300.w, 55.h),
          padding: EdgeInsets.zero,
          backgroundColor: isEdit ? primaryGreen : primaryPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        onPressed: () {
          if (formKey.currentState!.saveAndValidate() && !isEdit) {
            var id = const Uuid().v4();
            var currentUserId = FirebaseAuth.instance.currentUser!.uid;
            final categoryName =
                formKey.currentState!.fields['name']!.value;
            final category = CategoryEntity(
              name: categoryName,
              id: id,
              userId: currentUserId,
              createdAt: null,
              updatedAt: null,
            );
            context.read<CategoryCubit>().createCategory(category);
            context.pop();
          } else if (formKey.currentState!.saveAndValidate() && isEdit) {
            final categoryName =
                formKey.currentState!.fields['name']!.value;
            final category = CategoryEntity(
              name: categoryName,
              id: this.category!.id,
              userId: this.category!.userId,
              createdAt: this.category!.createdAt,
              updatedAt: this.category!.updatedAt,
            );
            context.read<CategoryCubit>().updateCategory(category);
            context.pop();
          }
        },
        child: Text(isEdit ? 'Update Category' : 'Create Category',
            style: Theme.of(context).textTheme.bodyB10White));
  }
}
