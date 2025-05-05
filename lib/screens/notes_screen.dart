import 'package:flutter/material.dart';
import 'package:stateman/main.dart';
import 'package:stateman/widget/custom_appBar.dart';
import 'package:stateman/widget/custom_bottomSheet.dart';
import 'package:stateman/widget/custom_bottomWidget.dart';
import 'package:stateman/widget/custom_notesBody.dart';
import 'package:stateman/widget/custom_notesItem.dart';
import 'package:stateman/widget/custom_textFiled.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                    margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    child: CustomBottomSheet());
              });
        },
        child: Icon(Icons.add),
      ),
      body: NotesItem(),
    );
  }
}
