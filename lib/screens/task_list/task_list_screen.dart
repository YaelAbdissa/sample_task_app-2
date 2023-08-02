import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../constants/constants.dart';

import '../../database/task_model.dart';
import '../../database/task_provider.dart';
import '../../widgets/text_widget.dart';
import '../add_task/add_task.dart';
import '../task_detail/task_detail.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          child: Container(
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
                  text: 'Task List',
                  textColor: colorForth,
                ),
                const SizedBox(height: 5),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: taskProvider.getAllTasks().length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return UITaskListWidget(
                        task: taskProvider.getAllTasks()[index],
                        taskProvider: taskProvider,
                        index: index,
                      );
                    })
              ],
            ),
          ),
        ),
        floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 72,
            width: 72,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddNewTaskScreen(
                      taskProvider: taskProvider,
                    ),
                  ),
                );
              },
              backgroundColor: primaryColor,
              child: SvgPicture.asset("assets/icons/add_icon.svg"),
            ),
          ),
        ),
      ),
    );
  }
}

class UITaskListWidget extends StatefulWidget {
  final TaskModel task;
  final int index;
  final TaskProvider taskProvider;
  const UITaskListWidget({
    super.key,
    required this.task,
    required this.taskProvider,
    required this.index,
  });

  @override
  State<UITaskListWidget> createState() => _UITaskListWidgetState();
}

class _UITaskListWidgetState extends State<UITaskListWidget> {
  @override
  Widget build(BuildContext context) {
    bool isCheck = widget.task.isChecked;
    return Container(
      height: 72,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: ShapeDecoration(
        color: const Color(0xFFF0F0F0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 2,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 19, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                widget.taskProvider.updateRecord(
                  widget.index,
                  TaskModel(
                    type: widget.task.type,
                    priority: widget.task.priority,
                    taskTitle: widget.task.taskTitle,
                    dueDate: widget.task.dueDate,
                    description: widget.task.description,
                    isChecked: !widget.task.isChecked,
                  ),
                );
              },
              child: Row(
                children: [
                  // icon,
                  Container(
                    height: 32,
                    width: 32,
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: isCheck ? colorGreen : whiteColor,
                      borderRadius: BorderRadius.circular(32.0),
                      border: isCheck
                          ? null
                          : Border.all(
                              width: 0.5,
                              color: const Color(0xffDEDEDE),
                            ),
                    ),
                    child: isCheck
                        ? SvgPicture.asset(
                            "assets/icons/check_icon.svg",
                          )
                        : null,
                  ),

                  const SizedBox(width: 15),
                  // column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        text: widget.task.taskTitle,
                        textColor: colorForth,
                        fontSize: 18,
                        fontFamily: fontNameRoboto,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      TextWidget(
                        text: widget.task.dueDate,
                        textColor: colorFifth,
                        fontSize: 14,
                        fontFamily: fontNameRoboto,
                        fontWeight: FontWeight.w600,
                      )
                    ],
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskDetailScreen(
                      task: widget.task,
                    ),
                  ),
                );
              },
              child: SizedBox(
                height: 24,
                width: 24,
                child: SvgPicture.asset(
                  "assets/icons/forward_icon.svg",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
