import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mangoto/src/controllers/detail_comic_controller.dart';
import 'package:mangoto/src/ui/chapter_comic_ui.dart';
import 'package:mangoto/src/ui/home_ui.dart';
import 'package:expandable_text/expandable_text.dart';

class DetailComicPage extends StatefulWidget {
  @override
  _DetailComicPage createState() => _DetailComicPage();
}

class _DetailComicPage extends State<DetailComicPage> {
  int _selectedTabMenu = 1;
  int detailTab = 1;
  int chapterTab = 2;
  DetailComicController controller = Get.put(DetailComicController());

  @override
  void initState() {
    this.controller.getComic();
    super.initState();
  }

  @override
  void dispose() {
    controller.setComicToDefault();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          height: 56,
          padding: EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            border: Border(top: BorderSide(width: 2.0, color: Colors.black12)),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                      width: 66,
                      child: Row(
                        children: [
                          CircleAvatar(
                              child: ClipOval(
                                  child: Image.network(
                                      'https://i1.sndcdn.com/avatars-Zb6FhWSzovp4iWWr-61CkuA-t500x500.jpg'))),
                          Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Tác giả',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600)),
                                  Text('Phong tại lưu lãng',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[500],
                                          fontWeight: FontWeight.w600)),
                                ],
                              ))
                        ],
                      ))),
              Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.blue,
                      backgroundColor: Colors.red,
                    ),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(EvaIcons.heart, color: Colors.white),
                          Text('Theo dõi',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    onPressed: () {},
                  )),
            ],
          ),
        ),
        body: ListView(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              fit: StackFit.passthrough,
              children: [
                Container(
                    width: double.infinity,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.35,
                    child: ClipPath(
                        clipper: CustomClipPath(),
                        child: Obx(() =>
                            Image(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  controller.comic.value.backgroundImage),
                            )))),
                Container(
                  margin: EdgeInsets.only(left: 20.0, bottom: 50.0),
                  alignment: Alignment.bottomLeft,
                  child: Obx(() =>
                      Text(
                        controller.comic.value.comicName,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0, bottom: 35.0),
                  alignment: Alignment.bottomLeft,
                  child: Obx(() =>
                      Text(
                        'Thể loại: ' + this.controller.getTag(),
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      )),
                ),
                Container(
                    padding: EdgeInsets.only(left: 20.0, top: 20.0),
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.35,
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )),
              ],
            ),
            Center(
              child: Container(
                  height: 40.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _selectedTabMenu = detailTab;
                          });
                        },
                        child: Container(
                          height: 30.0,
                          width: 130.0,
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(2.0),
                          child: Text('Chi tiết',
                              style: TextStyle(
                                  color: _selectedTabMenu == detailTab
                                      ? Colors.amber
                                      : Colors.black,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _selectedTabMenu = chapterTab;
                          });
                        },
                        child: Container(
                          width: 130.0,
                          height: 30.0,
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(2.0),
                          child: Text('Chương',
                              style: TextStyle(
                                  color: _selectedTabMenu == chapterTab
                                      ? Colors.amber
                                      : Colors.black,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ],
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black12)),
                  )),
            ),
            Container(
                child: _selectedTabMenu == 1
                    ? Detail()
                    : Container(
                    padding: EdgeInsets.all(10.0), child: Chapter()))
          ],
        ));
  }
}

class Chapter extends StatelessWidget {
  Chapter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          child: TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.black, alignment: Alignment.bottomLeft),
              onPressed: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('1. Chapter 1', style: TextStyle(fontSize: 15)),
                  Text('Chapter 1',
                      style: TextStyle(fontSize: 12, color: Colors.grey[400])),
                ],
              )),
        ),
        Divider(
          thickness: 1.0,
        ),
        Container(
          width: double.infinity,
          child: TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.black, alignment: Alignment.bottomLeft),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChapterComicPage()),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('1. Chapter 1', style: TextStyle(fontSize: 15)),
                  Text('Chapter 1',
                      style: TextStyle(fontSize: 12, color: Colors.grey[400])),
                ],
              )),
        ),
        Divider(
          thickness: 1.0,
        )
      ],
    );
  }
}

class Detail extends StatelessWidget {

  DetailComicController controller = Get.put(DetailComicController());

  Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Đánh giá',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        Text('4.5', style: TextStyle(color: Colors.grey[500])),
                      ],
                    ),
                    height: 60,
                    alignment: Alignment.center,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        border: Border.all(color: Colors.black12)),
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Chương',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        Text('123+', style: TextStyle(color: Colors.grey[500])),
                      ],
                    ),
                    height: 60,
                    alignment: Alignment.center,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        border: Border.all(color: Colors.black12)),
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Luợt đọc',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        Text('123', style: TextStyle(color: Colors.grey[500])),
                      ],
                    ),
                    height: 60,
                    alignment: Alignment.center,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        border: Border.all(color: Colors.black12)),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Obx(() =>
                  ExpandableText(
                    controller.comic.value.description,
                    expandText: 'Hiển thị thêm',
                    collapseText: 'Thu gọn',
                    maxLines: 4,
                    linkColor: Colors.blue,
                  )),
            ),
            Divider(
              height: 20,
              thickness: 4.0,
              color: Colors.grey[200],
            )
          ],
        ));
  }
}
