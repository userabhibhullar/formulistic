import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:formulistic/components/searchbar.dart';
import 'package:formulistic/components/topic_widget.dart';
import 'package:formulistic/models/topics.dart';
import 'package:formulistic/utils/color.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Main list
  static List<Topics> topics =
      List.generate(100, (index) => Topics("Product ${index}", "${index}"))
          .toList();
  // Displaying list
  List<Topics> displayed_topics = List.from(topics);
  // filtering result
  void _filterResult(String text) {
    setState(() {
      displayed_topics = topics
          .where((element) =>
              element.name!.toLowerCase().contains(text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          foregroundColor: AppColor.primary,
          title: const Text(
            "FORMULISTIC",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          shape: Border(
            bottom: BorderSide(color: AppColor.primary, width: 2),
          ),
          elevation: 0,
        ),
        body: Column(
          children: [
            // Search bar
            AppSearch(
              searchText: 'type here to search',
              onChange: (value) => _filterResult(value),
            ),
            // Space
            const SizedBox(height: 12),
            Expanded(
              child: Container(
                width: 360,
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 27,
                            childAspectRatio: 147 / 100),
                    itemCount: displayed_topics.length,
                    itemBuilder: (context, index) {
                      return TopicWidget(text: displayed_topics[index].name!);
                    }),
              ),
            )
          ],
        ));
  }
}
