import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:g_notes/src/config/themes/font_themes.dart';
import 'package:g_notes/src/core/constants/colors.dart';
import 'package:g_notes/src/core/constants/images.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: secondaryPurple,
      ),
      child: Row(
        children: [
          TextButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: primaryDarkBlue,
                fixedSize: Size(100.w, 35.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              onPressed: () {},
              icon: SvgPicture.asset(dark),
              label: Text(
                'Dark',
                style: Theme.of(context).textTheme.bodyB12White,
              )),
          TextButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                fixedSize: Size(100.w, 35.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              onPressed: () {},
              icon: SvgPicture.asset(light),
              label: Text(
                'Light',
                style: Theme.of(context).textTheme.bodyB12White,
              )),
        ],
      ),
    );
  }
}
