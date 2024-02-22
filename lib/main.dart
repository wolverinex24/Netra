import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:netra/core/theme/appTheme.dart';
import 'package:netra/features/languageselect/widgets/localization_services.dart';
import 'package:netra/features/splashScreen/screens/spalshscreen.dart';

void main() async {
  await GetStorage.init();
  LocalizationService localizationService = LocalizationService();
  await localizationService.init(); // Initialize the localization service
  Get.put(localizationService);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocalizationService(),
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallBackLocale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: AppTheme.primaryColor),
        ),
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: AppTheme.primaryColor)
                .copyWith(background: AppTheme.whiteColor),
        // Add more theme properties here
      ),
      home: const SplashScreen(),
    );
  }
}
