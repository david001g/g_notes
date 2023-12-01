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
        bodyPadding: EdgeInsets.symmetric(horizontal: 80.0.w),
        controlsMargin: EdgeInsets.only(bottom: 40.0.h),
        controlsPadding: EdgeInsets.symmetric(horizontal: 20.0.w),
        pages: [
          PageViewModel(
              titleWidget: SvgPicture.asset(technologies, height: 250.h),
              bodyWidget: SizedBox(
                width: 350.w,
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(scrollbars: false),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    runSpacing: 5.h,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.0.h),
                        child: Text(
                          "Technologies used in this project",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Gap(40.w),
                          Image.asset(cleanArchitecture, height: 50.h),
                          Gap(10.w),
                          Text("Clean Architecture",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold)),
                          const Spacer(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Gap(40.w),
                          SvgPicture.asset(codeMagic, height: 50.h),
                          Gap(10.w),
                          Text("CodeMagic for CICD",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold)),
                          const Spacer(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Gap(40.w),
                          SvgPicture.asset(firebase, height: 50.h),
                          Gap(10.w),
                          Text("Firebase Authentication/Firestore",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold)),
                          const Spacer(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Gap(40.w),
                          SvgPicture.asset(github, height: 50.h),
                          Gap(10.w),
                          Text("Github version control",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold)),
                          const Spacer(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Gap(40.w),
                          SvgPicture.asset(bloc, height: 50.h),
                          Gap(10.w),
                          Text("Bloc/Cubit for state management",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold)),
                          const Spacer(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Gap(40.w),
                          SvgPicture.asset(routing, height: 50.h),
                          Gap(10.w),
                          Text("GoRouter for navigation",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold)),
                          const Spacer(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Gap(40.w),
                          SvgPicture.asset(dependencyInjection, height: 50.h),
                          Gap(10.w),
                          Text("Get_it for dependency injection",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold)),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
          PageViewModel(
            titleWidget: SvgPicture.asset(getOnboard, height: 500.h),
            bodyWidget: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Lets get you onboard!",
                    style: TextStyle(fontSize: 20.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => context.goNamed(AppRoute.login.name),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[400],
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
