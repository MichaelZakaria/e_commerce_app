import 'package:e_commerce_app/bindings/general_bindings.dart';
import 'package:e_commerce_app/routes/app_routes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/theme/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


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

      initialBinding: GeneralBindings(),

      getPages: AppRoutes.pages,

      /// show loader or circular progress indicator meanwhile authentication repository is deciding to show relevant screen
      home: const Scaffold(backgroundColor: MyColors.primary, body: Center(child: CircularProgressIndicator(color: Colors.white,),),)
    );
  }
}
