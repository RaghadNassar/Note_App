import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stateman/controllers/notes_controller.dart';
import 'package:stateman/model/model_note.dart';
import 'package:stateman/screens/edit_screen.dart';
import 'package:stateman/widget/custom_container_listtile.dart';

class NotesBody extends StatelessWidget {
  const NotesBody({super.key, });
  //final NoteModel note;

  @override
  Widget build(BuildContext context) {
    final NotesController controller = Get.find();

    return Expanded(
      child: Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Obx(
            () => ListView.builder(
                itemCount: controller.listnotes.length,
                itemBuilder: (context, index) {
                  
                  return GestureDetector(
                      onTap: () {
                        Get.to(EditScreen(index: index),);
                      },
                      child: ContainerCoustomBody( index: index,));
                }),
          )),
    );
  }
}
