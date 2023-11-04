import 'package:flutter/material.dart';

import '../utils/color.dart';

class CalculatorDisplay extends StatelessWidget {
  final String expression;
  final String result;
  const CalculatorDisplay(
      {Key? key, required this.expression, required this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 14.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: AppColor.secondaryContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    expression,
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColor.secondaryContainerText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 2,
              color: AppColor.secondaryContainerText,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    result,
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColor.secondaryContainerText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
