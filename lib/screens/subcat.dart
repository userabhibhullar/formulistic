import 'package:flutter/material.dart';
import 'package:formulistic/utils/color.dart';

class Subcat extends StatefulWidget {
  final String title;
  const Subcat({Key? key, required this.title}) : super(key: key);

  @override
  _SubcatState createState() => _SubcatState();
}

class _SubcatState extends State<Subcat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        foregroundColor: AppColor.primary,
        title: Text(
          widget.title,
          style: TextStyle(
            color: AppColor.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        shape: Border(
          bottom: BorderSide(color: AppColor.primary, width: 2),
        ),
      ),
    );
  }
}
