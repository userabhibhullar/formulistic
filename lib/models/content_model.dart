class ContentModel {
  String? title;
  String? define;
  String? description;
  String? source;
  String? downloadURL;

  ContentModel(
      this.title, this.define, this.description, this.source, this.downloadURL);

  ContentModel.fromMap(Map<String, dynamic> data) {
    title = data['title'];
    define = data['define'];
    description = data['description'];
    source = data['source'];
    downloadURL = data['downloadURL'];
  }
}
