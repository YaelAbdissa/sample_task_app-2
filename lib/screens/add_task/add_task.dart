import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../database/task_provider.dart';

import '../../constants/constants.dart';
import '../../database/task_model.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/text_field_widget.dart';
import '../../widgets/text_widget.dart';

class AddNewTaskScreen extends StatefulWidget {
  final TaskProvider taskProvider;
  const AddNewTaskScreen({
    super.key,
    required this.taskProvider,
  });

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  String type = "";
  String timeFrame = "";
  String priority = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: SvgPicture.asset(
                      "assets/icons/back_icon.svg",
                    ),
                  ),
                ),
                const SizedBox(height: 17),
                TextWidget(
                  fontFamily: fontNamePoppins,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  text: 'Add New Task',
                  textColor: colorForth,
                ),
                const SizedBox(height: 16),
                TextWidget(
                  fontFamily: fontNamePoppins,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  text: 'Task',
                  textColor: colorForth,
                ),
                const SizedBox(height: 5),

                TaskTextFieldWidget(
                  text: 'Wireframing',
                  controller: taskTitleController,
                ),
                // Initially selected option

                const SizedBox(height: 10),
                TextWidget(
                  fontFamily: fontNamePoppins,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  text: 'Type',
                  textColor: colorForth,
                ),
                const SizedBox(height: 5),

                CustomDropDown(
                  onChanged: (option) {
                    setState(() {
                      type = option;
                    });
                  },
                  options: const [
                    'Work',
                    'Personal Project',
                    'Self',
                  ],
                ),
                const SizedBox(height: 10),
                TextWidget(
                  fontFamily: fontNamePoppins,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  text: 'Priority',
                  textColor: colorForth,
                ),
                const SizedBox(height: 5),

                CustomDropDown(
                  onChanged: (option) {
                    setState(() {
                      priority = option;
                    });
                  },
                  options: const [
                    "Needs done",
                    "Nice to have",
                    "Nice idea",
                  ],
                ),
                const SizedBox(height: 10),
                TextWidget(
                  fontFamily: fontNamePoppins,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  text: 'Time Frame',
                  textColor: colorForth,
                ),
                const SizedBox(height: 5),
                CustomDropDown(
                  onChanged: (option) {
                    setState(() {
                      timeFrame = option;
                    });
                  },
                  options: const [
                    "Today",
                    "Tonight",
                    "3 days",
                    "Week",
                    "Month",
                  ],
                ),

                const SizedBox(height: 16),
                TextWidget(
                  fontFamily: fontNamePoppins,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  text: 'Description',
                  textColor: colorForth,
                ),
                const SizedBox(height: 5),

                TaskTextFieldWidget(
                  text:
                      'The purpose of this project is to design a user-friendly and intuitive wireframing to-do list application that allows users to create, manage, and track their tasks efficiently. ',
                  haveMaxLines: true,
                  controller: taskDescriptionController,
                ),
                const SizedBox(height: 24),
                ButtonWidget(
                  onPressed: () {
                    widget.taskProvider.createRecord(
                      TaskModel(
                        type: type,
                        priority: priority,
                        taskTitle: taskTitleController.text,
                        dueDate: timeFrame,
                        description: taskDescriptionController.text,
                        isChecked: false,
                      ),
                    );
                    Navigator.pop(context);
                  },
                  bgColor: primaryColor,
                  buttonText: "Submit",
                  style: TextStyle(
                    color: whiteColor,
                    fontFamily: fontNamePoppins,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 56),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
