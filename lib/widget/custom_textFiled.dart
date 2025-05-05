import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  CustomTextFiled(
      {this.onChanged,
      this.obscureText,
      this.hinttext,
      this.labl,
      this.color,
      this.colorborder,
      this.textInputType,
      this.icon,
      this.textcontroler,
      this.maxlines,
      this.onSave
      // this.width
      });
  Function(String)? onChanged;
  void Function(String?)? onSave;
  String? hinttext;
  String? labl;
  bool? obscureText;
  Color? color;
  Color? colorborder;
  // double? width;
  final int? maxlines;

  TextInputType? textInputType;
  IconData? icon;
  final TextEditingController? textcontroler;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: TextFormField(
        onSaved: onSave,
        maxLines: maxlines,
        //  cursorWidth: width??2.0,
        // cursorHeight: hight,
        controller: textcontroler,
        keyboardType: textInputType,
        // obscureText: obscureText!,
        validator: (data) {
          if (data?.isEmpty ?? true) {
            return 'filed is required';
          } else {
            return null;
          }
        },
        onChanged: onChanged,
        decoration: InputDecoration(
            suffixIcon: Icon(icon),
            hintText: hinttext,
            labelText: labl,
            labelStyle: TextStyle(
              color: color,
            ),
            hintStyle: TextStyle(
              color: color,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: colorborder ?? Colors.grey,
            )),
            border: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.white,
            ))),
      ),
    );
  }
}
