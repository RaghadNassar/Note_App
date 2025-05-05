import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stateman/model/model_note.dart';
import 'package:stateman/widget/custom_appBar.dart';
import 'package:stateman/widget/custom_bottomWidget.dart';
import 'package:stateman/widget/custom_editItems.dart';
import 'package:stateman/widget/custom_search.dart';
import 'package:stateman/widget/custom_textFiled.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key, required this.index,});
  //final NoteModel note;
 final int index; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: CustomEdititems(index: index,),
      ),
    );
  }
}
