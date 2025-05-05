import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stateman/controllers/notes_controller.dart';
import 'package:stateman/model/model_note.dart';
import 'package:stateman/widget/lcustom_listtile.dart';

class ContainerCoustomBody extends StatelessWidget {
  const ContainerCoustomBody({super.key, required this.index});
  //final NoteModel note;
  final int index;

  @override
  Widget build(BuildContext context) {
  final NotesController controller = Get.find();
    final note = controller.listnotes[index];
     final color = Color(note.color);
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 8),
      padding: EdgeInsets.only(top: 14, left: 14, bottom: 14),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ListTileCustom(index: index,),
          Padding(
            padding: const EdgeInsets.only(right: 36),
            child: Text(
              '3.4.5',
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
