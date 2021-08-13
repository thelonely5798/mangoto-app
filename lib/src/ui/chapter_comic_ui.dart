import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mangoto/src/controllers/detail_comic_controller.dart';
import 'package:mangoto/src/ui/home_ui.dart';
import 'package:expandable_text/expandable_text.dart';

class ChapterComicPage extends StatefulWidget {
  @override
  _ChapterComicPage createState() => _ChapterComicPage();
}

class _ChapterComicPage extends State<ChapterComicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(),
      body: ListView(
        children: [
          Image.network(
              "https://uphinh.vn/images/2021/07/08/47548a227d0d118d1ecd7232ce81bfaa.jpg"),
          Image.network(
              "https://uphinh.vn/images/2021/07/08/2f49a3fcb3ceb705290194cdb2b38dc9.jpg"),
          Image.network(
              "https://uphinh.vn/images/2021/07/08/15a25d13815638e1a3cd42fa3e7afd4c.jpg"),
          Image.network(
              "https://uphinh.vn/images/2021/07/08/d082893d2bdbd4b8febf23da301a2d28.jpg"),
          Image.network(
              "https://uphinh.vn/images/2021/07/08/c7faeb1ca0b8155e246b2212ee65c1d2.jpg",
              fit: BoxFit.contain)
        ],
      ),
      bottomNavigationBar: _BottomNavigationBar(),
    );
  }
}

class AppBar extends StatefulWidget {
  @override
  _AppBar createState() => _AppBar();
}

class _AppBar extends State<AppBar> implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);
  ScrollController _scrollController = new ScrollController();
  bool _isAppbar = true;

  void setAppBar(bool status){
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Text"),
      backgroundColor: Colors.redAccent,
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  void onItemSelect(int index) {}

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              iconSize: 30,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              iconSize: 30,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.refresh),
              iconSize: 30,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.brightness_4),
              iconSize: 30,
              onPressed: () {},
            )
          ],
        ));
  }
}

//
// https://uphinh.vn/images/2021/07/08/47548a227d0d118d1ecd7232ce81bfaa.jpg
// https://uphinh.vn/images/2021/07/08/2f49a3fcb3ceb705290194cdb2b38dc9.jpg
// https://uphinh.vn/images/2021/07/08/15a25d13815638e1a3cd42fa3e7afd4c.jpg
// https://uphinh.vn/images/2021/07/08/d082893d2bdbd4b8febf23da301a2d28.jpg
// https://uphinh.vn/images/2021/07/08/4f36909ece74fba9f99aede6ab754871.jpg
// https://uphinh.vn/images/2021/07/08/c7faeb1ca0b8155e246b2212ee65c1d2.jpg
// https://uphinh.vn/images/2021/07/08/2f4b00519011b527a121920dc096e119.jpg
