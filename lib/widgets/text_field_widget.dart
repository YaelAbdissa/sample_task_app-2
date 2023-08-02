import 'package:flutter/material.dart';

import '../constants/constants.dart';

class TaskTextFieldWidget extends StatelessWidget {
  final String text;
  final bool haveMaxLines;
  final TextEditingController controller;
  const TaskTextFieldWidget({
    super.key,
    required this.text,
    this.haveMaxLines = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: haveMaxLines ? 8 : 1,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        hintText: text,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: borderColor,
          ),
        ),
        hintStyle: TextStyle(
          color: colorForth,
          fontFamily: fontNameRoboto,
          fontSize: 16,
        ),
      ),
      onChanged: (value) {},
    );
  }
}
