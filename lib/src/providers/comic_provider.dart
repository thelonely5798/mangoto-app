import 'dart:convert';

import 'package:get/get.dart';
import 'package:mangoto/src/dto/comic_provider_dto.dart';
import 'package:mangoto/src/models/comic_model.dart';
import 'package:http/http.dart' as http;
import 'package:mangoto/src/providers/http_config.dart';

final url = HttpConfig.url;

class ComicProvider {
  Future<RxList<ComicModel>> getAllComic() async {
    try {
      var response = await http.get(url + 'api/comic/GetAll');

      RxList<ComicModel> comics = RxList<ComicModel>();

      (jsonDecode(response.body) as List<dynamic>).forEach((element) {
        var comic = ComicModel.fromJson(element);
        comics.add(comic);
      });

      return comics;
    } catch (err) {
      return RxList();
    }
  }

  Future<RxList<GetComicInHomeScreenResponseDTO>>
      getComicsInHomeScreenComic() async {
    try {
      var response = await http.get(url + 'api/comic/GetInHomeScreen');
      RxList<GetComicInHomeScreenResponseDTO> comics =
          RxList<GetComicInHomeScreenResponseDTO>();

      (jsonDecode(response.body) as List<dynamic>).forEach((element) {
        var _comics = (element['comics'] as List<dynamic>)
            .map((e) => ComicModel.fromJson(e))
            .toList();
        comics.add(GetComicInHomeScreenResponseDTO(_comics, element['title']));
      });

      return comics;
    } catch (err) {
      return RxList();
    }
  }

  Future<ComicModel> getComic(int comicId) async {
    try {
      var response = await http.post(url + 'api/comic/GetComic',
        body: jsonEncode(<String, dynamic>{
        'id': comicId,
      }),);
      return ComicModel.fromJson(jsonDecode(response.body));
    } catch (err) {
      return ComicModel.getDefault();
    }
  }
}
