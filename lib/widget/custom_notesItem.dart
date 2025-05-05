
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stateman/controllers/theme_controller.dart';
import 'package:stateman/widget/custom_appBar.dart';
import 'package:stateman/widget/custom_notesBody.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>(); // استدعاء الكنترولر

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          CustomAppBar(
            text: 'Notes App',
            icons: Icons.light_mode,
            ontap: () {
              themeController.toggleTheme(); // تغيير الوضع عند الضغط
            },
          ),
          NotesBody(),
        ],
      ),
    );
  }
}
