import 'package:flutter/material.dart';
import 'package:g_notes/src/config/router/router.dart';
import 'package:g_notes/src/core/constants/images.dart';
import 'package:g_notes/src/core/layout/LayoutTemplate.dart';
import 'package:g_notes/src/features/authentication/view/widgets/profile_screen_components/profile_screen_container.dart';
import 'package:go_router/go_router.dart';

class CustomProfileScreen extends StatelessWidget {
  const CustomProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutTemplate(
      route: AppRoute.profile,
      topButtonTitle: "Back to Notes",
      topButtonIcon: backArrow,
      topNavigation: () => context.pushNamed(AppRoute.notes.name),
      child: const ProfileScreenContainer(),
    );
  }
}





