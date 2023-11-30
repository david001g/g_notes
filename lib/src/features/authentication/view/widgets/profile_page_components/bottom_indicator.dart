import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_notes/src/config/themes/font_themes.dart';
import 'package:g_notes/src/core/constants/colors.dart';

class BottomIndicator extends StatelessWidget {
  const BottomIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 162.w,
      height: 22.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
        color: primaryPurple,
      ),
      child: Center(
          child: Text('Profile Page',
              style: Theme.of(context).textTheme.bodyB14White)),
    );
  }
}
