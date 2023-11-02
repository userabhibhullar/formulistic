import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:formulistic/models/content_model.dart';

class ContentController {
  final Reference _storage = FirebaseStorage.instance.ref('images/');
  final CollectionReference _topics =
      FirebaseFirestore.instance.collection('topics');

  Future<ContentModel> fetchData(String documentId) async {
    Map<String, dynamic> content = {};
    await _topics.doc(documentId).get().then((data) {
      content = data.data() as Map<String, dynamic>;
    });
    await _storage.child(content['image']).getDownloadURL().then((downloadURL) {
      content['downloadURL'] = downloadURL;
    });
    ContentModel data = ContentModel.fromMap(content);
    return data;
  }
}
