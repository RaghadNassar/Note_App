// lib/controllers/localization_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stateman/main.dart';

class LocalizationController extends GetxController {
  //Locale initialLocale = const Locale('en', 'US');
  Locale initialLocale = box.read('lang') == 'ar' ? Locale('ar') : Locale('en');

  void changeLang(String langCode) {
    Locale locale = Locale(langCode);
    box.write('lang', langCode);
    Get.updateLocale(locale);
  }
}
