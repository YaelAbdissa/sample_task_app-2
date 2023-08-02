import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Color bgColor;
  final String buttonText;
  final TextStyle style;
  final Function onPressed;
  const ButtonWidget({
    super.key,
    required this.bgColor,
    required this.buttonText,
    required this.style,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 9),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(4.0),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Text(
          buttonText,
          style: style,
        ),
      ),
    );
  }
}
