import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mangoto/src/models/comic_model.dart';
import 'package:mangoto/src/models/tag_model.dart';
import 'package:mangoto/src/providers/%08comic_%1Dprovider.dart';
import 'package:mangoto/src/providers/tag_provider.dart';

class SearchComicController extends GetxController
    with StateMixin<List<dynamic>> {
  RxList<TagModel> tagList = RxList<TagModel>();
  var currentSelectedTagIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future getTags() async {
    var tags = await TagProvider().getTags();
    this.tagList.assignAll(tags);
  }

  List<Widget> renderListTags() {
    List<Widget> tags = [];

    tags = this
        .tagList
        .map((element) => Padding(
              padding: EdgeInsets.all(10.0),
              child: InkWell(
                onTap: (() {
                  this.currentSelectedTagIndex.value =
                      this.tagList.indexOf(element);
                }),
                child: Text(element.tagName,
                    style: TextStyle(
                        fontSize: 16,
                        color: this.currentSelectedTagIndex ==
                                this.tagList.indexOf(element).obs
                            ? Colors.redAccent
                            : Colors.black)),
              ),
            ))
        .toList();

    return tags;
  }
}
