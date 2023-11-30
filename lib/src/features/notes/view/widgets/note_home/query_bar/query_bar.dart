import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_notes/src/config/themes/font_themes.dart';
import 'package:g_notes/src/core/constants/colors.dart';
import 'package:g_notes/src/features/notes/view/widgets/note_home/query_bar/category_filter.dart';
import 'package:g_notes/src/features/notes/view/widgets/note_home/query_bar/query_item.dart';
import 'package:gap/gap.dart';

class QueryBar extends StatelessWidget {
  const QueryBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      width: 848.w,
      height: 65.h,
      decoration: BoxDecoration(
        color: primaryPurple,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Your Notes', style: Theme.of(context).textTheme.bodyB14White),
          Gap(200.w),
          const CategoryFilter(),
        ],
      ),
    );
  }
}
