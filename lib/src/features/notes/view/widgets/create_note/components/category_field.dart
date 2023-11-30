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

class CategoryField extends StatelessWidget {
  const CategoryField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<CategoryCubit>().getCategories();
    final List<CategoryEntity?> categories =
        context.read<CategoryCubit>().categories;
    return FormBuilderDropdown(
      name: 'category',
      decoration: InputDecoration(
        label: Text(
          'Category',
          style: Theme.of(context).textTheme.bodyB10Purple,
        ),
        hintText: 'Select a category',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: secondaryPurple, width: 1.5.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: secondaryPurple, width: 1.5.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: secondaryPurple, width: 1.5.w),
        ),
      ),
      items: categories.isEmpty
          ? ['No Categories Available']
              .map((category) => DropdownMenuItem(
                    //onTap: () => context.goNamed(AppRoute.createCategory.name),
                    value: null,
                    child: Text(
                      category,
                      style: Theme.of(context).textTheme.bodyB10Purple,
                    ),
                  ))
              .toList()
          : categories
              .map((category) => DropdownMenuItem(
                    value: category?.id!,
                    child: Text(
                      category!.name!,
                      style: Theme.of(context).textTheme.bodyB10Purple,
                    ),
                  ))
              .toList(),
    );
  }
}
