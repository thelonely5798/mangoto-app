import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mangoto/src/controllers/detail_comic_controller.dart';
import 'package:mangoto/src/models/comic_model.dart';
import 'package:mangoto/src/models/tag_model.dart';
import 'package:mangoto/src/providers/%08comic_%1Dprovider.dart';
import 'package:mangoto/src/ui/detail_comic_ui.dart';

class HomeController extends GetxController with StateMixin<List<dynamic>> {
  var count = 0.obs;
  var comicsInHome = [].obs;
  var loading = true.obs;
  late BuildContext context;

  var  detailComicController = Get.put(DetailComicController());
  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future fetchApi() async {
    this
        .comicsInHome
        .assignAll(await ComicProvider().getComicsInHomeScreenComic());
  }

  void setContext(dynamic context) {
    this.context = context;
    update();
  }

  String getTag(List<TagModel> tags) {
    if (tags.length == 0) return "";
    return tags[0].tagName;
  }

  void navigateToDetailComic(int comicId) {
    this.detailComicController.setComicId(comicId);
    Navigator.push(
      this.context,
      MaterialPageRoute(
        builder: (context) => DetailComicPage(),
      ),
    );
  }

  List<Widget> buildRow(List<ComicModel> listComics) {
    List<Widget> list = [];
    while (listComics.length > 0) {
      int maxNumberToSlice = listComics.length < 2 ? listComics.length : 2;
      Widget currentRow = new Row(
        children: listComics
            .take(maxNumberToSlice)
            .map((element) => Expanded(
                flex: 5,
                child: Card(
                  child: InkWell(
                    onTap: () {
                      navigateToDetailComic(element.id);
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 200.0,
                          width: double.infinity,
                          child: Image(
                              fit: BoxFit.fill,
                              image: NetworkImage(element.backgroundImage)),
                        ),
                        Container(
                            padding: EdgeInsets.all(5.0),
                            child: Container(
                                alignment: Alignment.topLeft,
                                height: 25.0,
                                child: Text(element.comicName,
                                    style: TextStyle(
                                        height: 1.0,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.0)))),
                        Container(
                            padding: EdgeInsets.all(5.0),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text('Thể loại: ' + getTag(element.tags),
                                    style: TextStyle(
                                        color: Colors.grey[500],
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11.0)))),
                      ],
                    ),
                  ),
                )))
            .toList(),
      );
      list.add(currentRow);
      listComics = listComics.sublist(maxNumberToSlice);
    }
    return list;
  }

  List<Widget> renderListComics() {
    List<Widget> list = [];

    if (this.comicsInHome.isBlank) {
      return list;
    }

    this.comicsInHome.forEach((element) {
      var title = Container(
          padding: EdgeInsets.all(10.0),
          child: Text(element.title,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0)));
      list.add(title);
      list..addAll(this.buildRow(element.comics));
    });

    return list;
  }
}
