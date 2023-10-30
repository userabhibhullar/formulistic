import 'package:flutter/material.dart';
import 'package:formulistic/screens/subcat.dart';
import 'package:formulistic/utils/color.dart';

class TopicWidget extends StatelessWidget {
  final String text;
  const TopicWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Subcat(title: text)))
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.secondary, borderRadius: BorderRadius.circular(7)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: AppColor.primary, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
