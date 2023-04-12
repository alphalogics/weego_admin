import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import 'core/binding/initial_binding.dart';
import 'core/constant/app_colors.dart';
import 'core/constant/app_strings.dart';
import 'core/routings/app_route.dart';
import 'core/utils/custom_scroll_behavior.dart';

class App extends StatelessWidget {

  // bool? lang = AppSharedPreferences.getIsLangEnglish();

  @override
  Widget build(BuildContext context) {
    // lang ??= false;

    return GetMaterialApp(
      title: title,
      initialBinding: InitialBinding(),
      scrollBehavior: AppScrollBehavior(),
      smartManagement: SmartManagement.full,
      initialRoute: Routes.initial,
      getPages: AppPages.pages,
      defaultTransition: Transition.native,
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      // translations: AppTranslation(),
      // locale: lang == true ? const Locale('en', 'US') : const Locale('ar', 'SA'),
      // locale: const Locale('en', 'US'),
      // locale: Get.deviceLocale,
      // fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
          primarySwatch: kcPrimaryMaterialColor, fontFamily: 'Sen'),
    );
  }
}