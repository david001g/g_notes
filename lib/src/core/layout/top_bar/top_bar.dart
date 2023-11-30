import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_notes/src/core/layout/top_bar/components/createButton.dart';
import 'package:gap/gap.dart';

class TopBar extends StatelessWidget {
  final String buttonTitle;
  final String icon;
  final Function() navigation;
  const TopBar({
    super.key, required this.buttonTitle, required this.navigation, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 588.w, height: 55.h, child: const SearchBar()),
        Gap(10.w),
        CreateButton(text: buttonTitle, navigation: navigation, icon: icon),
      ],
    );
  }
}
