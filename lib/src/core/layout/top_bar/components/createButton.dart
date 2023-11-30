import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:g_notes/src/config/themes/font_themes.dart';
import 'package:g_notes/src/core/constants/colors.dart';
import 'package:g_notes/src/core/constants/images.dart';
import 'package:g_notes/src/core/layout/top_bar/objects/top_bar_info.dart';
import 'package:g_notes/src/core/services/injection_containder.dart';

class CreateButton extends StatelessWidget {
  final String text;
  final String icon;
  final Function() navigation;
  const CreateButton({
    super.key, required this.text, required this.navigation, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          fixedSize: Size(240.w, 55.h),
          backgroundColor: primaryPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        onPressed: () => navigation(),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(text, style: Theme.of(context).textTheme.bodyB10White),
          SvgPicture.asset(
            icon,
            width: 29.w,
            height: 29.h,
          ),
        ]));
  }
}
