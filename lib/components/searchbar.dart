import 'package:flutter/material.dart';
import 'package:formulistic/utils/color.dart';

class AppSearch extends StatelessWidget {
  final String searchText;
  final void Function(String)? onChange;
  const AppSearch({Key? key, required this.searchText, required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: TextField(
          onChanged: onChange,
          style: TextStyle(color: AppColor.secondaryContainerText),
          decoration: InputDecoration(
            focusColor: AppColor.secondary,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.background)),
            filled: true,
            fillColor: AppColor.secondaryContainer,
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: AppColor.primary),
            ),
            suffixIcon: Icon(
              Icons.search,
              color: AppColor.secondary,
            ),
            hintText: searchText,
            hintStyle: TextStyle(color: AppColor.secondaryContainerText),
          ),
        ),
      ),
    );
  }
}
