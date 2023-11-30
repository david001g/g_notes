import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:g_notes/src/core/constants/images.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50.r,
      backgroundColor: Colors.blueGrey.shade200,
      child: SvgPicture.asset(
        starterAvatar,
        height: 50.h,
        width: 50.w,
      ),
    );
  }
}
