import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).colorScheme.primary;
    Color background = Theme.of(context).colorScheme.background;
    Color secondary = Theme.of(context).colorScheme.secondary;
    Color secondaryContainer = Theme.of(context).colorScheme.secondaryContainer;
    Color secondaryContainerText =
        Theme.of(context).colorScheme.onSecondaryContainer;
    Theme.of(context).colorScheme.onSecondaryContainer;
    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          foregroundColor: primary,
          title: const Text(
            "FORMULISTIC",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: [
            Container(height: 2, color: primary),
            Padding(
                padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: TextField(
                    style: TextStyle(color: secondaryContainerText),
                    decoration: InputDecoration(
                      focusColor: secondary,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: background)),
                      filled: true,
                      fillColor: secondaryContainer,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: primary),
                      ),
                      suffixIcon: Icon(
                        Icons.search,
                        color: secondary,
                      ),
                      hintText: "type to search...",
                      hintStyle: TextStyle(color: secondaryContainerText),
                    ),
                  ),
                ))
          ],
        ));
  }
}
