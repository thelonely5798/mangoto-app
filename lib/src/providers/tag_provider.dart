import 'dart:convert';

import 'package:get/get.dart';
import 'package:mangoto/src/dto/comic_provider_dto.dart';
import 'package:mangoto/src/models/comic_model.dart';
import 'package:http/http.dart' as http;
import 'package:mangoto/src/models/tag_model.dart';
import 'package:mangoto/src/providers/http_config.dart';

final url = HttpConfig.url;

class TagProvider {

  Future<RxList<TagModel>> getTags() async {
    RxList<TagModel> tags = RxList<TagModel>();
    var response = await http.get(url + 'api/tag/GetAll');
    (jsonDecode(response.body) as List).forEach((element) {
      tags.add(TagModel.fromJson(element));
    });
    return tags;
  }

}
