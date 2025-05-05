import 'package:flutter/material.dart';

class CustomBottomWidget extends StatelessWidget {
  CustomBottomWidget(
      {required this.text,
      this.ontap,
      this.color,
      this.width,
      this.isLoading = false});
  String text;
  VoidCallback? ontap;
  Color? color;
  double? width;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Container(
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(16)),
          //  width: double.infinity,
          width: width,
          height: 50,
          child: Center(
            child: isLoading
                ? CircularProgressIndicator(color: Colors.white)
                : Text(
                    text,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
          ),
        ),
      ),
    );
  }
}
