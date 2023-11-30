import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:g_notes/src/config/router/router.dart';
import 'package:g_notes/src/core/constants/images.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        showDoneButton: false,
        showNextButton: true,
        showBackButton: true,
        next: const Text("Next"),
        back: const Text("Back"),
        bodyPadding: EdgeInsets.symmetric(horizontal: 80.0.w, vertical: 40.0.h),
        controlsMargin: EdgeInsets.only(bottom: 40.0.h, top: 40.0.h),
        controlsPadding: EdgeInsets.symmetric(horizontal: 20.0.w),
        pages: [
          PageViewModel(
            title: "Effortlessly create and organize your notes",
            body:
                "Start jotting down your notes now and experience the simplicity of organized thinking at your fingertips.",
            image: Center(
              child: SvgPicture.asset(notesIntro, height: 500.h),
            ),
          ),
          PageViewModel(
            title: "Stay organized with categories",
            body:
                "Create custom categories to keep your thoughts in perfect order, and never lose track of your most valuable information again",
            image: Center(
              child: SvgPicture.asset(categoriesIntro, height: 500.h),
            ),
          ),
          PageViewModel(
            title: "Lets get you onboard!",
            image: Center(
              child: SvgPicture.asset(getOnboard, height: 500.h),
            ),
            bodyWidget: Column(
              children: [
                ElevatedButton(
                  onPressed: () => context.goNamed(AppRoute.login.name),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(200.w, 50.h),
                  ),
                  child: const Text("Sign In"),
                ),
                Gap(20.h),
                ElevatedButton(
                  onPressed: () => context.goNamed(AppRoute.register.name),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(200.w, 50.h),
                  ),
                  child: const Text("Sign Up"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
