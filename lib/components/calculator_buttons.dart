import 'package:flutter/material.dart';
import 'package:formulistic/utils/color.dart';

class CalculatorButtons extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Function(String text) controller;
  const CalculatorButtons(
      {Key? key,
      required this.text,
      required this.width,
      required this.height,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller(text),
      child: Padding(
        padding: const EdgeInsets.only(right: 11),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: AppColor.secondary,
              borderRadius: BorderRadius.circular(4)),
          child: Center(
              child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
          )),
        ),
      ),
    );
  }
}
