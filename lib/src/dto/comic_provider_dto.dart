import 'package:mangoto/src/models/comic_model.dart';

class GetComicInHomeScreenResponseDTO {
  late List<ComicModel> comics;
  late String title;
  GetComicInHomeScreenResponseDTO(this.comics, this.title);
}

class GetComicRequestDTO {
  late int id;
  GetComicRequestDTO(this.id);
}