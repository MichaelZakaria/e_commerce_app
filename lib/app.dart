import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/theme/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'features/authentication/screens/onboarding/onboarding.dart';


class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,

      home: const OnBoardingScreen(),
    );
  }
}
