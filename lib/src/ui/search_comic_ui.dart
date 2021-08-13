import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mangoto/src/controllers/search_comic_controller.dart';

class SearchComic extends StatefulWidget {
  @override
  _SearchComic createState() => _SearchComic();
}

class _SearchComic extends State<SearchComic> {
  SearchComicController controller = Get.put(SearchComicController());

  @override
  void initState() {
    super.initState();
    controller.getTags();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(()=>Row(
                    children: controller.renderListTags(),
                  )))),
          Container(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              cursorColor: Colors.redAccent,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.redAccent[400],
                ),
                focusColor: Colors.black,
                hintText: 'Tìm kiếm truyện',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12, width: 1.0),
                    borderRadius: BorderRadius.circular(18.0)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12, width: 1.0),
                    borderRadius: BorderRadius.circular(18.0)),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text('Truyện ngẫu nhiên',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0))),
          Row(
            children: [
              Expanded(
                  flex: 5,
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                          height: 200.0,
                          width: double.infinity,
                          child: Image(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  'https://images8.intercomics.club/vnstory/cc/77/cc779e0cd055e4952488ca6b6e826d1c.jpeg')),
                        ),
                        Container(
                            padding: EdgeInsets.all(5.0),
                            child: Container(
                                height: 25.0,
                                alignment: Alignment.topLeft,
                                child: Text('Đấu phá thương khung',
                                    style: TextStyle(
                                        height: 1.0,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.0)))),
                        Container(
                            padding: EdgeInsets.all(5.0),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text('Thể loại: Huyền huyễn',
                                    style: TextStyle(
                                        color: Colors.grey[500],
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11.0)))),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 5,
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                          height: 200.0,
                          width: double.infinity,
                          child: Image(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  'http://st.imageinstant.net/data/comics/11/an-hon-100-choc-tuc-vo-yeu-mua-mot-tang-1282.jpg')),
                        ),
                        Container(
                            padding: EdgeInsets.all(5.0),
                            child: Container(
                                height: 25.0,
                                alignment: Alignment.topLeft,
                                child: Text(
                                    'Ẩn hôn 100%: Chọc tức vợ yêu mua một tặng một',
                                    style: TextStyle(
                                        height: 1.0,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.0)))),
                        Container(
                            padding: EdgeInsets.all(5.0),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text('Thể loại: Huyền huyễn',
                                    style: TextStyle(
                                        color: Colors.grey[500],
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11.0)))),
                      ],
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
