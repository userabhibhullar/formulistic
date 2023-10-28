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
        appBar: AppBar(
          backgroundColor: background,
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
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: primary),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: primary,
                      ),
                      hintText: "type to search...",
                    ),
                  ),
                ))
          ],
        ));
  }
}
