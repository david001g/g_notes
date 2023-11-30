import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:g_notes/src/config/themes/font_themes.dart';
import 'package:g_notes/src/core/constants/colors.dart';

class CategoryNameField extends StatelessWidget {
  final String? name;
  const CategoryNameField({
    super.key, required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: FormBuilderTextField(
        initialValue: name,
        name: 'name',
        decoration: InputDecoration(
          label: Text(
            'Name',
            style: Theme.of(context).textTheme.bodyB10Purple,
          ),
          hintText: 'Enter category name',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
                color: secondaryPurple, width: 1.5.w),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
                color: secondaryPurple, width: 1.5.w),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
                color: secondaryPurple, width: 1.5.w),
          ),
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
        ]),
      ),
    );
  }
}
