import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_notes/src/common/navbar_widgets/logo_widget.dart';
import 'package:g_notes/src/common/navbar_widgets/menu_item.dart';
import 'package:g_notes/src/common/navbar_widgets/theme_switch.dart';
import 'package:g_notes/src/config/router/router.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../core/constants/images.dart';

class Navbar extends StatelessWidget {
  final AppRoute route;

  const Navbar({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 276.w,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Gap(20.h),
          const LogoWidget(),
          Gap(100.h),
          if (route == AppRoute.notes) ...[
            MenuItem(
              isActive: true,
              title: 'NOTES',
              iconActive: notesActive,
              iconNotActive: notesNotActive,
              onPress: () => context.pushNamed(AppRoute.notes.name),
            ),
          ] else ...[
            MenuItem(
              isActive: false,
              title: 'NOTES',
              iconActive: notesNotActive,
              iconNotActive: notesNotActive,
              onPress: () => context.pushNamed(AppRoute.notes.name),
            )
          ],
          Gap(10.h),
          if (route == AppRoute.categories) ...[
            MenuItem(
              isActive: true,
              title: 'CATEGORIES',
              iconActive: categoriesActive,
              iconNotActive: categoriesNotActive,
              onPress: () => context.goNamed(AppRoute.categories.name),
            ),
          ] else ...[
            MenuItem(
              isActive: false,
              title: 'CATEGORIES',
              iconActive: categoriesActive,
              iconNotActive: categoriesNotActive,
              onPress: () => context.goNamed(AppRoute.categories.name),
            )
          ],
          Gap(10.h),
          if (route == AppRoute.createNote) ...[
            MenuItem(
              isActive: true,
              title: 'QUICK NOTES',
              iconActive: plusActive,
              iconNotActive: plusNotActive,
              onPress: () => context.goNamed(AppRoute.createNote.name),
            ),
          ] else ...[
            MenuItem(
              isActive: false,
              title: 'QUICK NOTES',
              iconActive: plusActive,
              iconNotActive: plusNotActive,
              onPress: () => context.pushNamed(AppRoute.createNote.name),
            )
          ],
          Gap(10.h),
          if (route == AppRoute.profile) ...[
            MenuItem(
              isActive: true,
              title: 'PROFILE',
              iconActive: profileActive,
              iconNotActive: profileNotActive,
              onPress: () => context.goNamed(AppRoute.profile.name),
            ),
          ] else ...[
            MenuItem(
              isActive: false,
              title: 'PROFILE',
              iconActive: profileActive,
              iconNotActive: profileNotActive,
              onPress: () => context.pushNamed(AppRoute.profile.name),
            )
          ],
          Gap(100.h),
          //const ThemeSwitch(),
          Gap(20.h),
        ],
      ),
    );
  }
}
