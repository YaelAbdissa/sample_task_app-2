import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/constants.dart';

class CustomDropDown extends StatefulWidget {
  final List<String> options;
  final void Function(String) onChanged;
  const CustomDropDown(
      {super.key, required this.options, required this.onChanged});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          '',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: colorForth,
            fontFamily: fontNameRoboto,
          ),
        ),
        items: widget.options
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: colorForth,
                      fontFamily: fontNameRoboto,
                    ),
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (String? value) {
          setState(() {
            selectedValue = value;
          });
          widget.onChanged(selectedValue!);
        },
        iconStyleData: IconStyleData(
          icon: SvgPicture.asset("assets/icons/drop_down_down.svg"),
          iconSize: 14,
          iconEnabledColor: colorThird,
        ),
        buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.only(right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: Colors.black26,
            ),
            color: whiteColor,
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          scrollPadding: const EdgeInsets.only(right: 7),
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(14),
            color: colorSecond,
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
      ),
    );
  }
}
