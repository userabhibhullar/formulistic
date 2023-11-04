import 'package:flutter/material.dart';
import 'package:formulistic/screens/content.dart';
import 'package:formulistic/utils/color.dart';

class TopicWidget extends StatelessWidget {
  final String documentId;
  const TopicWidget({Key? key, required this.documentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Content(documentId: documentId)))
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.secondary, borderRadius: BorderRadius.circular(7)),
        child: Center(
          child: Center(
            child: Text(
              documentId.toUpperCase(),
              style: TextStyle(
                  color: AppColor.primary,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}
