import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_notes/src/core/constants/colors.dart';
import 'package:gap/gap.dart';

class ContentField extends StatelessWidget {
  ContentField({
    super.key,
    required this.controller,
    this.content,
  });
  final QuillController controller;
  String? content;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      name: 'content',
      builder: (FormFieldState<String> field) {
        return QuillProvider(
          configurations: QuillConfigurations(
            controller: controller,
            sharedConfigurations: const QuillSharedConfigurations(
              locale: Locale('en'),
            ),
          ),
          child: Container(
            height: 400.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: secondaryPurple, width: 1.5.w),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(10.h),
                const QuillToolbar(),
                Divider(
                  color: secondaryPurple,
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                    child: QuillEditor.basic(
                      configurations: const QuillEditorConfigurations(
                        placeholder: 'Note body',

                        readOnly: false,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
