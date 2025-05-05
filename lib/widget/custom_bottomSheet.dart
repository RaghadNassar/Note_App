import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stateman/controllers/notes_controller.dart';
import 'package:stateman/model/model_note.dart';
import 'package:stateman/widget/custom_bottomWidget.dart';
import 'package:stateman/widget/custom_textFiled.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: CustomBottomForm());
  }
}

//

class CustomBottomForm extends StatelessWidget {
  const CustomBottomForm({super.key});

  @override
  Widget build(BuildContext context) {
    final NotesController controller = Get.find();

    return Obx(() => Form(
          key: controller.key,
          autovalidateMode: controller.autoValidateMode.value,
          child: Column(
            children: [
              CustomTextFiled(
                onSave: (value) => controller.title = value,
                labl: 'title'.tr,
                color: Colors.purple,
                hinttext: '1'.tr,
                colorborder: Colors.purple,
              ),
              CustomTextFiled(
                onSave: (value) => controller.subtitle = value,
                labl: 'descrption'.tr,
                color: Colors.purple,
                hinttext: '2'.tr,
                colorborder: Colors.purple,
                maxlines: 6,
              ),
              const SizedBox(height: 30),
              CustomBottomWidget(
                text: 'notes_app'.tr,
                width: 190,
                color: Colors.purple,
                ontap: () {
                  if (controller.key.currentState!.validate()) {
                    controller.key.currentState!.save();
                    final note = NoteModel(
                      title: controller.title!,
                      subtitle: controller.subtitle!,
                      date: DateTime.now().toString(),
                      color: controller.getRandomColor().value,
                    );
                    controller.addNotes(note);
                    Get.back();
                  } else {
                    controller.autoValidateMode.value =
                        AutovalidateMode.always;
                  }
                },
              ),
            ],
          ),
        ));
  }
}

