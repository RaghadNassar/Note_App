import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stateman/controllers/notes_controller.dart';
import 'package:stateman/model/model_note.dart';

class ListTileCustom extends StatelessWidget {
  const ListTileCustom({
    super.key, required this.index,
  });
  //final NoteModel note;
  final int index;

  @override
  Widget build(BuildContext context) {
    final NotesController controller = Get.find();
     final note = controller.listnotes[index];
    return ListTile(
      title: Text(
        note.title,
        style: TextStyle(fontSize: 17, color: Colors.black),
      ),
      subtitle: Text(
        note.subtitle,
        style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.5)),
      ),
      trailing: IconButton(
          onPressed: () {
            controller.deletNotes(index);
          },
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          )),
    );
  }
}
