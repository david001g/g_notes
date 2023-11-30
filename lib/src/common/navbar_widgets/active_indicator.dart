import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_notes/src/core/constants/colors.dart';

class ActiveIndicator extends StatelessWidget {
  const ActiveIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 23.h,
      width: 8.w,
      decoration: BoxDecoration(
        color: primaryPurple,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          bottomLeft: Radius.circular(10.r),
        ),
      ),
    );
  }
}
