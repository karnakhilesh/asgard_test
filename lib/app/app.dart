import 'package:asgard/app/core/internationalization/internationalization.dart';
import 'package:asgard/app/core/routes/routes.dart';
import 'package:asgard/app/core/theme/theme.dart';
import 'package:asgard/app/modules/products/presentation/bindings/product_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AsgardApp extends StatelessWidget {
  const AsgardApp({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: const Size(360, 779),
        minTextAdapt: true,
        builder: (_, __) => GetMaterialApp(
          translations: AsgardTranslations(),
          locale: const Locale('en', 'US'),
          fallbackLocale: const Locale('en', 'US'),
          initialBinding: ProductBinding(),
          theme: lightTheme,
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          title: "asg_asgardAppStr".tr,
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
          defaultTransition: Transition.leftToRight,
          transitionDuration: const Duration(milliseconds: 200),
        ),
      );
}
