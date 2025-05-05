
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:stateman/controllers/notes_controller.dart';
import 'package:stateman/controllers/theme_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    //Get.put(ThemeController());
    Get.put(NotesController());
  }
}