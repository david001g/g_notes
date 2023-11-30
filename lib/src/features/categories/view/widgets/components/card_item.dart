import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_notes/src/config/themes/font_themes.dart';
import 'package:g_notes/src/core/constants/colors.dart';
import 'package:g_notes/src/features/categories/domain/entities/category.dart';
import 'package:g_notes/src/features/categories/view/bloc/category_cubit.dart';
import 'package:g_notes/src/features/categories/view/pages/create_category_dialog.dart';
import 'package:gap/gap.dart';

class CardItem extends StatelessWidget {
  final CategoryEntity? category;
  const CardItem({
    super.key, this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.blueGrey[50],
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              category!.name!,
              style: Theme.of(context).textTheme.bodyB20,
            ),
            Gap(20.h),
            TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  fixedSize: Size(180.w, 45.h),
                  backgroundColor: primaryPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                onPressed: () => showCreateCategoryDialog(context, category),
                child: Text('Edit',
                    style: Theme.of(context).textTheme.bodyB10White)),
            Gap(10.h),
            TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  fixedSize: Size(180.w, 45.h),
                  backgroundColor: primaryRed,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                onPressed: () => context.read<CategoryCubit>().deleteCategory(category!.id!),
                child: Text('Delete',
                    style: Theme.of(context).textTheme.bodyB10White)),
          ],
        ),
      ),
    );
  }
}
