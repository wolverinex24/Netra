import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:netra/features/languageselect/widgets/en_US.dart';
import 'package:netra/features/languageselect/widgets/hi_IN.dart';

class LocalizationService extends Translations {
  static final box = GetStorage();

  static final language = ['English', 'Hindi'];
  static final locales = [
    Locale('en', 'US'),
    Locale('hi', 'IN'),
  ];

  Future<void> init() async {
    await GetStorage.init();
    
    final savedLang = box.read('language');
    if (savedLang != null) {
      final locale = getLocaleFromLanguage(savedLang);
      if (locale != null) {
        Get.updateLocale(locale);
      }
    }
  }

  void changeLocale(String lang) {
    final locale = getLocaleFromLanguage(lang);
    box.write('language', lang);
    Get.updateLocale(locale!);
  }

  Locale? getLocaleFromLanguage(String lang) {
    for (int i = 0; i < language.length; i++) {
      if (lang == language[i]) return locales[i];
    }
    return Get.locale;
  }

  Locale getCurrentLocale() {
    Locale defaultLocale;

    if (box.read('language') != null) {
      final locale = getLocaleFromLanguage(box.read('language'));
      defaultLocale = locale!;
    } else {
      defaultLocale = Locale('en', 'US');
    }

    return defaultLocale;
  }

  String getCurrentLang() {
    return box.read('language') != null ? box.read('language') : 'English';
  }

  @override
  Map<String, Map<String, String>> get keys => {'en_US': enUS, 'hi_IN': hiIN};
}
