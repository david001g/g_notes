import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_notes/src/config/router/router.dart';
import 'package:g_notes/src/config/themes/font_themes.dart';
import 'package:g_notes/src/core/constants/colors.dart';
import 'package:g_notes/src/features/authentication/domain/entities/user.dart';
import 'package:g_notes/src/features/authentication/view/bloc/authentication_cubit.dart';
import 'package:go_router/go_router.dart';

class UpdateProfileButton extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  const UpdateProfileButton({
    super.key, required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 300.w,
        height: 55.h,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: primaryPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            onPressed: () {
              if(formKey.currentState!.validate()){
                final currentUserId = FirebaseAuth.instance.currentUser!.uid;
                final name = formKey.currentState!.fields['name']!.value;
                final email = formKey.currentState!.fields['email']!.value;
                UserEntity user = UserEntity(name: name, email: email, id: currentUserId, image: '');
                context.read<AuthenticationCubit>().updateUser(user);
                context.goNamed(AppRoute.notes.name);
              }else{
                print('validation failed');
              }
            },
            child: Text('Update Profile',
                style: Theme.of(context).textTheme.bodyB10White)));
  }
}
