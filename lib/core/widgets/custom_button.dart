import 'package:bookapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.textButton,
      required this.backgroundColor,
      required this.textColor,
      this.borderRadius,
      this.fontSize, this.onPressed});
  final String textButton;
  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final double? fontSize;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            shadowColor: Colors.blueGrey,
            elevation: 80,
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(12),
            ),
          ),
          onPressed: onPressed,
          child: Text(textButton,
              style: Styles.textStyle18.copyWith(
                color: textColor,
              ))),
    );
  }
}
