import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:netra/core/theme/appTheme.dart';
import 'package:netra/features/languageselect/widgets/localization_services.dart';
import 'package:netra/features/splashScreen/screens/spalshscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  LocalizationService localizationService = LocalizationService();
  await localizationService.init();
  Get.put(localizationService);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocalizationService(),
      locale: Get.find<LocalizationService>().getCurrentLocale(),
      fallbackLocale: Locale('en', 'US'), // Set your default fallback locale here
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
