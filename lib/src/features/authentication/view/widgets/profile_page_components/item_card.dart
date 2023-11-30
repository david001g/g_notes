import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:g_notes/src/config/themes/font_themes.dart';
import 'package:g_notes/src/core/constants/colors.dart';
import 'package:g_notes/src/core/constants/images.dart';

class ItemCard extends StatelessWidget {
  final int notesLength;
  final String title;
  final String icon;

  const ItemCard({
    super.key,
    required this.notesLength,
    required this.title, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 218.w,
      height: 55.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: primarySecondaryPurple,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundColor: primaryPurple,
            child: SvgPicture.asset(
              color: Colors.white,
              icon,
              height: 22.h,
              width: 22.w,
            ),
          ),
          SizedBox(
              width: 80.w,
              child: Center(
                  child:
                  Text(title, style: Theme.of(context).textTheme.bodyB14))),
          Text('$notesLength',
              style: Theme.of(context).textTheme.bodyB20Purple),
        ],
      ),
    );
  }
}
