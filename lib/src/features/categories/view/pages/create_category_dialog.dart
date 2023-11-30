import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_notes/src/config/themes/font_themes.dart';
import 'package:g_notes/src/features/categories/domain/entities/category.dart';
import 'package:g_notes/src/features/categories/view/widgets/components/category_name_field.dart';
import 'package:g_notes/src/features/categories/view/widgets/components/submit_button.dart';
import 'package:gap/gap.dart';


Future<void> showCreateCategoryDialog(context, CategoryEntity? category) async {
  await showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      final formKey = GlobalKey<FormBuilderState>();
      final String? categoryName = category?.name;
      return SimpleDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        title: Center(
            child: Text('Create Category',
                style: Theme.of(context).textTheme.bodyB20)),
        children: [
          SizedBox(
            width: 300.w,
            height: 200.h,
            child: FormBuilder(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CategoryNameField(name: categoryName),
                    Gap(20.h),
                    SubmitButton(
                        formKey: formKey,
                        isEdit: category != null,
                        category: category),
                  ],
                )),
          ),
        ],
      );
    },
  );
}


