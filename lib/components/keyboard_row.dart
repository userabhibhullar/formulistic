import 'package:flutter/material.dart';
import 'package:formulistic/components/calculator_buttons.dart';

class KeyboardRow extends StatelessWidget {
  final List<String> rowButtons;
  final Function(String text) controller;
  const KeyboardRow(
      {Key? key, required this.rowButtons, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 13,
        left: 11,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _buttons(rowButtons.length),
      ),
    );
  }

  List<Widget> _buttons(int numButtons) {
    double width;
    double height;
    if (numButtons == 3) {
      width = 110;
      height = 100;
    } else {
      width = 80;
      height = 60;
    }
    List<Widget> buttons = [];
    rowButtons.forEach((String text) {
      buttons.add(
        CalculatorButtons(
            text: text, width: width, height: height, controller: controller),
      );
    });
    return buttons;
  }
}
