import 'package:flutter/material.dart';
import 'package:formulistic/controller/content_controller.dart';
import 'package:formulistic/models/content_model.dart';
import 'package:formulistic/utils/color.dart';
import 'package:url_launcher/url_launcher.dart';

class Content extends StatefulWidget {
  final String documentId;
  const Content({Key? key, required this.documentId}) : super(key: key);

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  late ContentModel content;

  Future fetchData() async {
    await ContentController().fetchData(widget.documentId).then((value) {
      content = value;
    });
  }

  _launchUrl() async {
    Uri uri = Uri.parse(content.source!);
    if (!await launchUrl(uri)) {
      throw Exception("failed to open browser");
    }
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
              return const Center(child: Text("Error fetching data..."));
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
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Image.network(
          height: 200,
          content.downloadURL!,
          filterQuality: FilterQuality.high,
          fit: BoxFit.fill,
        ),
        const SizedBox(
          height: 14.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Text(
            "Define: \"${content.define!}\"",
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ),
        const SizedBox(
          height: 14.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Text(
            content.description!,
            style: TextStyle(color: AppColor.secondaryContainer),
          ),
        ),
        const SizedBox(
          height: 6.0,
        ),
        GestureDetector(
          onTap: () => _launchUrl(),
          child: Center(
            child: Text(
              "Read More...",
              style: TextStyle(
                  color: AppColor.secondary, fontWeight: FontWeight.w700),
            ),
          ),
        )
      ]),
    );
  }
}
