import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:g_notes/src/config/themes/font_themes.dart';
import 'package:g_notes/src/core/constants/images.dart';
import 'package:gap/gap.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          logo,
          height: 67.h,
          width: 67.w,
        ),
        Gap(20.h),
        Text(
          'G.Notes',
          style: Theme.of(context).textTheme.mainTitle,
        ),
      ],
    );
  }
}
