import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_notes/src/common/navbar_widgets/active_indicator.dart';
import 'package:g_notes/src/common/navbar_widgets/menu_button.dart';
import 'package:gap/gap.dart';

class MenuItem extends StatelessWidget {
  bool isActive;
  String title;
  String iconActive;
  String iconNotActive;
  Function onPress;

  MenuItem({
    super.key,
    required this.isActive,
    required this.title,
    required this.iconActive,
    required this.iconNotActive,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Gap(5.h),
        MenuButton(isActive: isActive, title: title, iconActive: iconActive, iconNotActive: iconNotActive, onPress: onPress,),
        Gap(5.h),
        isActive ? const ActiveIndicator() : Gap(8.h),
      ],
    );
  }
}
