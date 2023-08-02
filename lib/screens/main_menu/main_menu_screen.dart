import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/constants.dart';
import '../../widgets/text_widget.dart';
import '../task_list/task_list_screen.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              TextWidget(
                fontFamily: fontNamePoppins,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                text: 'What would you like to do today?',
                textColor: colorForth,
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TaskListScreen()));
                },
                child: Container(
                  width: 160,
                  height: 96,
                  decoration: ShapeDecoration(
                    color: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    shadows: [
                      BoxShadow(
                        color: boxShadowColor,
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16, left: 16),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: TextWidget(
                            fontFamily: fontNameRoboto,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            text: 'Tasks',
                            textColor: whiteColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12, right: 12),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: 48,
                            height: 48,
                            padding: const EdgeInsets.only(
                                top: 6, left: 8, right: 8, bottom: 10),
                            child:
                                SvgPicture.asset("assets/icons/task_icon.svg"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
