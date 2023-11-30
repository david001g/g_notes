import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:g_notes/src/config/router/router.dart';
import 'package:g_notes/src/config/themes/font_themes.dart';
import 'package:g_notes/src/core/constants/images.dart';
import 'package:g_notes/src/features/authentication/view/bloc/authentication_cubit.dart';
import 'package:go_router/go_router.dart';

class TopBarLogout extends StatelessWidget {
  const TopBarLogout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Logout', style: Theme.of(context).textTheme.bodyB14),
        InkWell(
            onTap: () async{
              await context.read<AuthenticationCubit>().signOut();
              context.goNamed(AppRoute.login.name);
            },
            child: SvgPicture.asset(logoutIcon, height: 22.h, width: 22.w))
      ],
    );
  }
}
