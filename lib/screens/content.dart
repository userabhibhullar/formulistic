import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:formulistic/utils/color.dart';

class Content extends StatefulWidget {
  final String documentId;
  const Content({Key? key, required this.documentId}) : super(key: key);

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  CollectionReference topics = FirebaseFirestore.instance.collection('topics');
  Map<String, dynamic> content = {};

  Future fetchData() async {
    await topics.doc(widget.documentId).get().then((data) {
      content = data.data() as Map<String, dynamic>;
      print(content['description']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          backgroundColor: AppColor.background,
          title: Text(
            widget.documentId.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
          ),
          centerTitle: true,
          elevation: 0,
          shape: Border(
            bottom: BorderSide(color: AppColor.primary, width: 2),
          ),
        ),
        body: FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("error${snapshot.error}");
              return const Text("error");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    color: AppColor.secondary,
                    strokeWidth: 2,
                  ),
                ),
              );
            }
            return _buildContent();
          },
        ));
  }

  Widget _buildContent() {
    return Container(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 14.0, left: 10),
          child: Text(
            content['title'].toString().toUpperCase(),
            style: TextStyle(
                fontSize: 32,
                color: AppColor.primary,
                fontWeight: FontWeight.w700),
          ),
        ),
      ]),
    );
  }
}
