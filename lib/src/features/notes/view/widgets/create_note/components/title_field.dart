import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:g_notes/src/config/themes/font_themes.dart';
import 'package:g_notes/src/core/constants/colors.dart';

class TitleField extends StatelessWidget {
  String? title;
  TitleField({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    print(title);
    return FormBuilderTextField(
      initialValue: title,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
      decoration: InputDecoration(
        label: Text(
          'Title',
          style: Theme.of(context).textTheme.bodyB10Purple,
        ),
        hintText: 'Give a title to your note',
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
      name: 'title',
      onChanged: (val) {
        print(val); // Print the text value write into TextField
      },
    );
  }
}
