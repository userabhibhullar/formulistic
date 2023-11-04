import 'package:flutter/material.dart';
import 'package:formulistic/components/app_bar_widget.dart';
import 'package:formulistic/components/searchbar.dart';
import 'package:formulistic/components/topic_card.dart';
import 'package:formulistic/controller/topics_controller.dart';
import 'package:formulistic/models/topics_model.dart';
import 'package:formulistic/screens/calculator.dart';
import 'package:formulistic/utils/color.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<TopicsModel> topics = [];
  List<TopicsModel> displayTopics = [];
  bool hasFetch = false;

  Future fetchTopics() async {
    if (!hasFetch) {
      await TopicController().getTopics().then((value) {
        topics = value;
        displayTopics = topics;
      });
    }
    hasFetch = true;
  }

  void filterFeed(String value) {
    setState(() {
      displayTopics = topics
          .where((topic) =>
              topic.documentId!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBarWidget(appbar: AppBar(), text: 'FORMULISTIC'),
      body: Column(
        children: [
          // Open Calculator Button
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Calculator(),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 14.0),
              child: Container(
                height: 64,
                decoration: BoxDecoration(
                  color: AppColor.secondary,
                  borderRadius: BorderRadius.circular(7.0),
                ),
                child: Center(
                  child: Text("Open Calculator",
                      style: TextStyle(
                        fontSize: 24,
                        color: AppColor.primary,
                      )),
                ),
              ),
            ),
          ),
          // Search bar
          AppSearch(
            searchText: 'type here to search',
            onChange: (value) => filterFeed(value),
          ),
          // Space
          const SizedBox(height: 12),
          _buildTopicsWidget()
        ],
      ),
    );
  }

  // build topic Widget
  Widget _buildTopicsWidget() {
    return Expanded(
      child: SizedBox(
        width: 360,
        child: _buildTopicsGrid(),
      ),
    );
  }

  // build topic
  Widget _buildTopicsGrid() {
    return FutureBuilder(
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
            documentId: displayTopics[index].documentId!,
          );
        },
      ),
    );
  }
}
