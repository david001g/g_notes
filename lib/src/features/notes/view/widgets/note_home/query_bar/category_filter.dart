import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:g_notes/src/config/router/router.dart';
import 'package:g_notes/src/config/themes/font_themes.dart';
import 'package:g_notes/src/core/constants/images.dart';
import 'package:g_notes/src/features/categories/domain/entities/category.dart';
import 'package:g_notes/src/features/categories/view/bloc/category_cubit.dart';
import 'package:g_notes/src/features/notes/view/bloc/notes_cubit.dart';
import 'package:go_router/go_router.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<CategoryCubit>().getCategories();
    final List<CategoryEntity?> categories =
        context.read<CategoryCubit>().categories;

    return Container(
      width: 166.w,
      height: 33.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: DropdownButton(
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
                      onTap: () => context
                          .read<NotesCubit>()
                          .sortByCategory(category!.id!),
                      value: category?.id!,
                      child: Text(
                        category!.name!,
                        style: Theme.of(context).textTheme.bodyB10Purple,
                      ),
                    ))
                .toList(),
        onChanged: (value) {},
        style: Theme.of(context).textTheme.bodyB14White,
        icon: SvgPicture.asset(
          categoryDropdown,
          width: 18.w,
          height: 18.h,
        ),
        alignment: Alignment.centerRight,
        underline: Container(),
      ),
    );
  }
}
