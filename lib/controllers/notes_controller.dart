import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:stateman/constant/const.dart';
import 'package:stateman/model/model_note.dart';



// class NotesBinding implements Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<NotesController>(() => NotesController());
//   }
// }




class NotesController extends GetxController {
  var autoValidateMode = AutovalidateMode.disabled.obs;
  final List<Color> noteColors = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.orange,
  Colors.purple,
  Colors.teal,
];

Color getRandomColor() {
  return noteColors[DateTime.now().millisecondsSinceEpoch % noteColors.length];
}

  var listnotes = <NoteModel>[].obs;
  String? title;
  String ?subtitle;
  final GlobalKey<FormState> key = GlobalKey();

  TextEditingController titleController=TextEditingController();
  TextEditingController subtitleController=TextEditingController();

  NoteModel? note;
  @override
  void onInit() {
    // TODO: implement onInit
    openBox();
    super.onInit();
  }

  void addNotes(NoteModel note) async {
   // var box = await Hive.box(kNoteBox);
   var box = Hive.box<NoteModel>(kNoteBox);

    await box.add(note);
    listnotes.add(note);
  }

  void deletNotes(int index) async {
    //var box = await Hive.box(kNoteBox);
    var box = Hive.box<NoteModel>(kNoteBox);

    box.deleteAt(index);
    listnotes.removeAt(index);
  }

  void editNotes(NoteModel newnote, int index) async {
   // var box = await Hive.box(kNoteBox);
   var box = Hive.box<NoteModel>(kNoteBox);

    await box.putAt(index, newnote);
    listnotes[index] = newnote;
    listnotes.refresh();
  }

  void openBox() async {
    var box = Hive.box<NoteModel>(kNoteBox); // بدون await، لأنه مفتوح من قبل

    listnotes.addAll(box.values);
  }
}
