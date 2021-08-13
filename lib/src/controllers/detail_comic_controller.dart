import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mangoto/src/models/comic_model.dart';
import 'package:mangoto/src/models/tag_model.dart';
import 'package:mangoto/src/providers/%08comic_%1Dprovider.dart';
import 'package:mangoto/src/ui/detail_comic_ui.dart';

class DetailComicController extends GetxController
    with StateMixin<List<dynamic>> {
  RxInt comicId = 0.obs;
  Rx<ComicModel> comic = ComicModel.getDefault().obs;

  @override
  void onInit() async {
    super.onInit();
  }

  Future getComic() async {
    var _comic = await ComicProvider().getComic(this.comicId.value.toInt());
    this.comic.value = _comic;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    super.dispose();
  }


  void setComicId(int comicId) {
    this.comicId.value = comicId;
  }

  String getTag() {
    return this.comic.value.tags.map((e) => e.tagName).toSet().join(', ');
  }

  void setComicToDefault() {
    this.comic = ComicModel.getDefault().obs;
  }
}
