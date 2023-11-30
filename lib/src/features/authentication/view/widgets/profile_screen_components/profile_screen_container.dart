import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_notes/src/features/authentication/view/widgets/common/profile_avatar.dart';
import 'package:g_notes/src/features/authentication/view/widgets/profile_screen_components/email_field.dart';
import 'package:g_notes/src/features/authentication/view/widgets/profile_screen_components/logout_button.dart';
import 'package:g_notes/src/features/authentication/view/widgets/profile_screen_components/name_field.dart';
import 'package:g_notes/src/features/authentication/view/widgets/profile_screen_components/update_profile_button.dart';
import 'package:gap/gap.dart';

class ProfileScreenContainer extends StatelessWidget {
  const ProfileScreenContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return Container(
      width: 650.w,
      height: 719.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: FormBuilder(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 60.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ProfileAvatar(),
                Gap(30.h),
                const NameField(),
                const EmailField(),
                SizedBox(
                  height: 30.h,
                ),
                UpdateProfileButton(formKey: formKey),
                const LogoutButton(),
              ],
            ),
          )),
    );
  }
}
