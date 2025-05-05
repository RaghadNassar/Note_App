import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stateman/controllers/theme_controller.dart';
import 'package:stateman/widget/custom_search.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.text, this.icons,this.ontap});
  final String? text;
  final IconData? icons;

 final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
  //final ThemeController controller=Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text ?? '',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
    
        CustomSearch(icons: icons,ontap: ontap,),
      ],
    );
  }
}
