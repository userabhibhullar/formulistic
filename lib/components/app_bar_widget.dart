import 'package:flutter/material.dart';
import 'package:formulistic/utils/color.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final AppBar appbar;
  const AppBarWidget({Key? key, required this.appbar, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: AppColor.primary,
      title: Text(
        text,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
      ),
      centerTitle: true,
      shape: Border(
        bottom: BorderSide(color: AppColor.primary, width: 2),
      ),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appbar.preferredSize.height);
}
