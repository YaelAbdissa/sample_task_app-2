import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../database/task_model.dart';

import '../../constants/constants.dart';
import '../../widgets/text_widget.dart';

class TaskDetailScreen extends StatelessWidget {
  final TaskModel task;
  const TaskDetailScreen({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: SvgPicture.asset(
                      "assets/icons/back_icon.svg",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 17),
              TextWidget(
                fontFamily: fontNamePoppins,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                text: task.taskTitle,
                textColor: colorForth,
              ),
              const SizedBox(height: 25),
              TaskDetailRow(
                leftChild: TextWidget(
                  fontFamily: fontNamePoppins,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  text: "Type: ",
                  textColor: colorForth,
                ),
                rightChild: TextWidget(
                  fontFamily: fontNameRoboto,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  text: task.type,
                  textColor: colorForth,
                ),
              ),
              TaskDetailRow(
                leftChild: TextWidget(
                  fontFamily: fontNamePoppins,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  text: "Priority: ",
                  textColor: colorForth,
                ),
                rightChild: TextWidget(
                  fontFamily: fontNameRoboto,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  text: task.priority,
                  textColor: colorForth,
                ),
              ),
              TaskDetailRow(
                leftChild: TextWidget(
                  fontFamily: fontNamePoppins,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  text: "TimeFrame: ",
                  textColor: colorForth,
                ),
                rightChild: TextWidget(
                  fontFamily: fontNameRoboto,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  text: task.dueDate,
                  textColor: colorForth,
                ),
              ),
              TaskDetailColumn(
                leftChild: TextWidget(
                  fontFamily: fontNamePoppins,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  text: "Description: ",
                  textColor: colorForth,
                ),
                rightChild: TextWidget(
                  fontFamily: fontNameRoboto,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  text: task.description,
                  textColor: colorForth,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TaskDetailRow extends StatelessWidget {
  final Widget leftChild;
  final Widget rightChild;
  const TaskDetailRow(
      {super.key, required this.leftChild, required this.rightChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Row(
        children: [
          leftChild,
          rightChild,
        ],
      ),
    );
  }
}

class TaskDetailColumn extends StatelessWidget {
  final Widget leftChild;
  final Widget rightChild;
  const TaskDetailColumn(
      {super.key, required this.leftChild, required this.rightChild});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        leftChild,
        const SizedBox(height: 5),
        rightChild,
      ],
    );
  }
}
