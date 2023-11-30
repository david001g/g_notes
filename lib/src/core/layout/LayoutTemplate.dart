import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_notes/src/common/navbar.dart';
import 'package:g_notes/src/features/authentication/view/pages/profile_page.dart';
import 'package:g_notes/src/config/router/router.dart';
import 'package:g_notes/src/core/layout/top_bar/top_bar.dart';
import 'package:gap/gap.dart';

class LayoutTemplate extends StatelessWidget {
  final Widget child;
  final AppRoute route;
  final String topButtonTitle;
  final String topButtonIcon;
  final Function() topNavigation;

  const LayoutTemplate(
      {super.key,
      required this.route,
      required this.child,
      required this.topButtonTitle,
      required this.topButtonIcon,
      required this.topNavigation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Navbar(
            route: route,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Gap(40.h),
            TopBar(
                buttonTitle: topButtonTitle,
                navigation: topNavigation,
                icon: topButtonIcon),
            Gap(25.h),
            child,
            Gap(40.h),
          ]),
          const ProfilePage()
        ],
      ),
    ));
  }
}
