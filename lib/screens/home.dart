import 'package:flutter/material.dart';
import 'package:formulistic/components/searchbar.dart';
import 'package:formulistic/components/topic_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:formulistic/utils/color.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<String> topics = [];
  List<String> displayTopics = [];
  bool hasFetch = false;

  Future fetchTopics() async {
    if (!hasFetch) {
      await FirebaseFirestore.instance.collection('topics').get().then(
            (snapshot) => snapshot.docs.forEach(
              (documents) {
                topics.add(documents.reference.id);
                displayTopics = topics;
              },
            ),
          );
    }
    hasFetch = true;
  }

  void filterFeed(String value) {
    setState(() {
      displayTopics = topics
          .where((topic) => topic.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
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
            onChange: (value) => filterFeed(value),
          ),
          // Space
          const SizedBox(height: 12),
          Expanded(
            child: SizedBox(
              width: 360,
              child: FutureBuilder(
                future: fetchTopics(),
                builder: (context, snapshot) => GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 27,
                      childAspectRatio: 147 / 100),
                  itemCount: displayTopics.length,
                  itemBuilder: (context, index) {
                    return TopicWidget(
                      documentId: displayTopics[index],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
