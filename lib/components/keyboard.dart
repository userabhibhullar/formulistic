import 'package:flutter/material.dart';
import 'package:formulistic/components/keyboard_row.dart';

class Keyboard extends StatelessWidget {
  final List keyboardSigns;
  final Function(String text) controller;
  const Keyboard(
      {Key? key, required this.keyboardSigns, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: keyboardSigns.map((signs) {
          return KeyboardRow(
            rowButtons: signs,
            controller: controller,
          );
        }).toList(),
      ),
    );
  }
}
