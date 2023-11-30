import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:g_notes/src/config/themes/font_themes.dart';
import 'package:g_notes/src/core/constants/colors.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.w,
      child: FormBuilderTextField(
        name: 'email',
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
        ]),
        decoration: InputDecoration(
          label: Text(
            'Email',
            style: Theme.of(context).textTheme.bodyB10Purple,
          ),
          hintText: 'Enter your email',
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
      ),
    );
  }
}
