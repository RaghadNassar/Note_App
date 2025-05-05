// lib/lang/translations.dart
import 'package:get/get.dart';
import 'package:stateman/lang/ar.dart';
import 'package:stateman/lang/en.dart';


class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'ar_SY': arSY,
      };
}
