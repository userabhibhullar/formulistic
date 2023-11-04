import 'dart:math';

import 'package:flutter/material.dart';
import 'package:formulistic/components/keyboard.dart';
import 'package:formulistic/utils/constants.dart';
import 'package:formulistic/components/app_bar_widget.dart';
import 'package:formulistic/components/calculator_display.dart';
import 'package:formulistic/utils/color.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String equation = "0";
  String expression = "";
  String result = "0";

  _onTap(String text) {
    setState(() {
      if (text == CLEAR_SIGN) {
        equation = "0";
        result = "0";
      } else if (text == CLEAR_EXPRESSION_SIGN) {
        equation = "0";
      } else if (text == DEL_SIGN) {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = ZERO;
        }
      } else if (text == EQ_SIGN) {
        expression = equation;
        expression = expression.replaceAll(PIE_SIGN, '(3.1415926535897932)');
        expression = expression.replaceAll(SIN_SIGN, 'sin');
        expression = expression.replaceAll(COS_SIGN, 'cos');
        expression = expression.replaceAll(TAN_SIGN, 'tan');
        expression = expression.replaceAll(SQ_SIGN, 'sqrt');
        print(expression);
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = "=${exp.evaluate(EvaluationType.REAL, cm)}";
        } catch (e) {
          result = "Error";
        }
      } else {
        if (equation == "0") {
          equation = text;
        } else {
          equation = equation + text;
        }
      }
    });
  }

  _getResult() {
    Parser p = Parser();
    Expression exp = p.parse(equation);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      result = "Ans=${eval.toString()}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBarWidget(appbar: AppBar(), text: "CALCULATOR"),
      body: Column(
        children: [
          CalculatorDisplay(expression: equation, result: result),
          Keyboard(keyboardSigns: CalculatorKeyboard, controller: _onTap)
        ],
      ),
    );
  }
}
