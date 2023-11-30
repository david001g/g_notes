import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_notes/src/core/constants/colors.dart';
import 'package:g_notes/src/features/notes/view/bloc/pagination_cubit.dart';

class PageNavigator extends StatelessWidget {
  const PageNavigator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 30.w),
      child: Container(
        height: 25.h,
        width: 81.w,
        decoration: BoxDecoration(
          color: primaryPurple,
          borderRadius: BorderRadius.circular(40.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => context.read<PaginationCubit>().previousPage(),
              splashRadius: 10.r,
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 12.sp,
              ),
            ),
            const VerticalDivider(
              width: 1,
              color: Colors.white,
              thickness: 1.5,
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => context.read<PaginationCubit>().nextPage(),
              splashRadius: 10.r,
              icon: Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
