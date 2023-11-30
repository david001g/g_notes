import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_notes/src/config/themes/font_themes.dart';
import 'package:g_notes/src/core/constants/images.dart';
import 'package:g_notes/src/features/authentication/domain/entities/user.dart';
import 'package:g_notes/src/features/authentication/view/widgets/profile_page_components/bottom_indicator.dart';
import 'package:g_notes/src/features/authentication/view/widgets/profile_page_components/item_card.dart';
import 'package:g_notes/src/features/authentication/view/widgets/common/profile_avatar.dart';
import 'package:g_notes/src/features/authentication/view/widgets/profile_page_components/top_bar_logout.dart';
import 'package:gap/gap.dart';

class ProfilePageContainer extends StatelessWidget {
  final UserEntity? user;
  final int notesLength;
  final int categoriesLength;

  const ProfilePageContainer({
    super.key,
    this.user,
    required this.notesLength,
    required this.categoriesLength,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 20.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.white,
      ),
      width: 240.w,
      height: 846.h,
      child: Padding(
        padding: EdgeInsets.only(
          top: 20.h,
          left: 20.h,
          right: 20.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TopBarLogout(),
            const ProfileAvatar(),
            Text(user!.name!, style: Theme.of(context).textTheme.bodyB14),
            Gap(40.h),
            ItemCard(notesLength: notesLength, title: 'Notes', icon: notesNotActive),
            ItemCard(notesLength: categoriesLength, title: 'Categories', icon: categoriesNotActive),
            Gap(60.h),
            const BottomIndicator()
          ],
        ),
      ),
    );
  }
}
