import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage_pro/get_storage_pro.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:stateman/binding/app_initializer.dart';
import 'package:stateman/binding/initial_binding.dart';
import 'package:stateman/constant/const.dart';
import 'package:stateman/controllers/theme_controller.dart';
import 'package:stateman/lang/localization_controller.dart';
import 'package:stateman/lang/tranzlation.dart';
import 'package:stateman/model/model_note.dart';
import 'package:stateman/screens/notes_screen.dart';
import 'package:stateman/widget/custom_search.dart';

final box = GetStorage();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await  initializeApp();
  //await Hive.openBox('settings');
  // تأكد من تسجيل الـ Adapter
  Hive.registerAdapter(NoteModelAdapter());
  // افتح الصندوق بصيغة NoteModel وليس dynamic
  await Hive.openBox<NoteModel>(kNoteBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     
    return Obx(() {
      final controller = Get.find<ThemeController>();
      final localeController = Get.find<LocalizationController>();
      return GetMaterialApp(
        initialBinding: InitialBinding(),
         translations: AppTranslations(),
        locale: localeController.initialLocale,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode:
            controller.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
        home: const NotesScreen(),
      );
    });
  }
}
