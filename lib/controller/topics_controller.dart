import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:formulistic/models/topics_model.dart';

class TopicController {
  CollectionReference topics = FirebaseFirestore.instance.collection('topics');

  Future<List<TopicsModel>> getTopics() async {
    List<TopicsModel> topic = [];
    await topics.get().then((snapshot) {
      for (var documents in snapshot.docs) {
        topic.add(TopicsModel(documents.reference.id));
      }
    });
    return topic;
  }
}
