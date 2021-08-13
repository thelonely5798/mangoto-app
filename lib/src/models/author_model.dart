class AuthorModel {
  late String authorName;


  AuthorModel.fromJson(Map<String, dynamic> jsonDecoded){
    this.authorName = jsonDecoded['author_name'];

  }

}