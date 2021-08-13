import 'package:mangoto/src/models/author_model.dart';
import 'package:mangoto/src/models/tag_model.dart';

class ComicModel {
  late int id;
  late String comicName;
  late String description;
  late int view;
  late AuthorModel author;
  late String backgroundImage;
  List<TagModel> tags = [];

  ComicModel({required this.backgroundImage, required this.comicName, required this.tags}) {

  }
  ComicModel.fromJson(Map<String, dynamic> jsonDecoded){
    this.comicName = jsonDecoded['comic_name'];
    this.description = jsonDecoded['description'];
    this.view = jsonDecoded['view'];
    this.author = AuthorModel.fromJson(jsonDecoded['author']);
    this.backgroundImage = jsonDecoded['background_image'];
    this.id = jsonDecoded['id'];

    if((jsonDecoded['tags'] as List).length > 0){
      (jsonDecoded['tags'] as List).forEach((element) {
        this.tags.add(TagModel.fromJson(element['tag']));
      });
    }
  }
  ComicModel.getDefault(){
    this.backgroundImage = 'https://image.freepik.com/free-vector/white-blurred-background_1034-249.jpg';
    this.tags = [];
    this.comicName = '';
    this.description = '';
  }
}