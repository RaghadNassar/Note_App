import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stateman/controllers/notes_controller.dart';
import 'package:stateman/lang/localization_controller.dart';
import 'package:stateman/model/model_note.dart';
import 'package:stateman/widget/custom_appBar.dart';
import 'package:stateman/widget/custom_bottomWidget.dart';
import 'package:stateman/widget/custom_textFiled.dart';

class CustomEdititems extends StatelessWidget {
  final int index;

  const CustomEdititems({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final NotesController controller = Get.find();
    final localeController = Get.find<LocalizationController>();

    final note = controller.listnotes[index];
    controller.titleController.text = note.title;
    controller.subtitleController.text = note.subtitle;

    return Form(
      key: controller.key,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomAppBar(
            text: 'edit_note'.tr,
            icons: Icons.arrow_back,
            ontap: () => Get.back(),
          ),
          const Spacer(),
          CustomTextFiled(
            labl: 'title'.tr,
            color: Colors.purple,
            hinttext: '1'.tr,
            colorborder: Colors.purple,
            textcontroler: controller.titleController,
            onSave: (value) => controller.title = value!,
          ),
          CustomTextFiled(
            labl: 'descrption'.tr,
            color: Colors.purple,
            hinttext: '2'.tr,
            colorborder: Colors.purple,
            maxlines: 6,
            textcontroler: controller.subtitleController,
            onSave: (value) => controller.subtitle = value!,
          ),
          const SizedBox(height: 30),
          CustomBottomWidget(
            text: 'save'.tr,
            //  width: 190,
            color: Colors.purple,
            ontap: () {
              if (controller.key.currentState!.validate()) {
                controller.key.currentState!.save();

                controller.editNotes(
                  NoteModel(
                    title: controller.title!,
                    subtitle: controller.subtitle!,
                    date: DateTime.now().toString(),
                    color: controller.listnotes[index].color,
                  ),
                  index,
                );

                Get.back();
              }
            },
          ),
          CustomBottomWidget(
            text: 'english'.tr,
            color: Colors.purple,
            ontap: () {
              localeController.changeLang('en');
            },
          ),
          CustomBottomWidget(
            text: 'arabic'.tr,
            color: Colors.purple,
            ontap: () {
              localeController.changeLang('ar');
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
