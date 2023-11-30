import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_notes/src/core/constants/colors.dart';

class EmptyIndicator extends StatelessWidget {
  final double height;
  final double width;
  const EmptyIndicator({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width.w,
      height: height.h,
      child: EmptyWidget(
        image: null,
        packageImage: PackageImage.Image_1,
        title: 'No Items Found',
        subTitle: 'No items found. Add a new item to get started.',
        titleTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: primaryPurple,
        ),
        subtitleTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: secondaryPurple,
        ),
      ),
    );
  }
}
