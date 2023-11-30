import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_notes/src/features/notes/view/widgets/note_home/pagination/components/current_page_display.dart';
import 'package:g_notes/src/features/notes/view/widgets/note_home/pagination/components/page_navigator.dart';
import 'package:g_notes/src/features/notes/view/widgets/note_home/pagination/components/pagination_numbers.dart';

class PaginationBar extends StatelessWidget {
  const PaginationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 850.w,
      height: 55.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CurrentPageDisplay(),
          PaginationNumbers(),
          PageNavigator(),
        ],
      ),
    );
  }
}




