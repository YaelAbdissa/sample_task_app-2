import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  const TextWidget({
    super.key,
    required this.text,
    required this.textColor,
    required this.fontSize,
    required this.fontFamily,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      ),
    );
  }
}
