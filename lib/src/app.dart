import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/router/router.dart';
import 'config/themes/app_themes.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 930),
      minTextAdapt: true,
      splitScreenMode: true,
      child: AdaptiveTheme(
        initial: AdaptiveThemeMode.light,
        light: ThemeData.light(useMaterial3: true),
        dark: ThemeData.dark(useMaterial3: true),
        builder: (ThemeData light, ThemeData dark) { return MaterialApp.router(
          routerConfig: goRouter,
          debugShowCheckedModeBanner: false,
          restorationScopeId: 'app',
          theme: theme(),
        ); },
      ),
    );
  }
}
