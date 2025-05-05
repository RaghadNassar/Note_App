import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage_pro/get_storage_pro.dart';
import 'package:stateman/controllers/theme_controller.dart';
import 'package:stateman/lang/localization_controller.dart';

Future<void> initializeApp() async {
  await GetStorage.init();
  Get.put(ThemeController());
  Get.put(LocalizationController());
}
