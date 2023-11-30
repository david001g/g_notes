import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:g_notes/src/config/themes/font_themes.dart';
import 'package:gap/gap.dart';

class MenuButton extends StatelessWidget {
  bool isActive;
  String title;
  String iconActive;
  String iconNotActive;
  Function onPress;

  MenuButton({
    super.key,
    required this.isActive,
    required this.title,
    required this.iconActive,
    required this.iconNotActive,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(220.w, 40.h),
        backgroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      onPressed: () => onPress(),
      child: Row(
        children: [
          Gap(10.w),
          SvgPicture.asset(
            isActive ? iconActive : iconNotActive,
            height: 28.h,
            width: 28.w,
          ),
          Gap(20.w),
          Text(
            title,
            style: isActive ? Theme.of(context).textTheme.menuItemActive : Theme.of(context).textTheme.menuItemNotActive,
          ),
        ],
      ),
    );
  }
}
