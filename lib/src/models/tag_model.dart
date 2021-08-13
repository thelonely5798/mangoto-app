class TagModel {
  late String tagName;


  TagModel.fromJson(Map<String, dynamic> jsonDecoded){
    this.tagName = jsonDecoded['tag_name'];
  }

}