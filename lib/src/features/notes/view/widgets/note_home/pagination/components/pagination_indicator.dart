import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_notes/src/core/constants/colors.dart';

class PaginationIndicator extends StatelessWidget {
  const PaginationIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      width: 23.w,
      decoration: BoxDecoration(
        color: primaryPurple,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
    );
  }
}
