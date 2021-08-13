import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mangoto/src/models/example_model.dart';
import 'package:mangoto/src/ui/detail_comic_ui.dart';
import 'package:mangoto/src/ui/search_comic_ui.dart';
import 'package:mangoto/src/ui/home_ui.dart';
import 'package:mangoto/src/ui/setting_ui%08.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class MainpageController extends GetxController {
  var tabIndex = 0.obs;

  void tabIndexChange(int value) {
    tabIndex.value = value;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class MainPage extends StatefulWidget {

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MainpageController _mainpageController =
      Get.put(MainpageController(), permanent: false);

  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Obx(() => IndexedStack(
              index: _mainpageController.tabIndex.value,
              children: [
                HomePage(),
                SearchComic(),
                SettingPage(),
              ],
            )),
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
      ),
      bottomNavigationBar: Obx(() => BottomNavyBar(
          selectedIndex: _mainpageController.tabIndex.value,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: _mainpageController.tabIndexChange,
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: Icon(EvaIcons.home, size: 20),
              title: Text('Trang chủ'),
              inactiveColor: Colors.grey[400],
              activeColor: Colors.amber,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(EvaIcons.moon, size: 20),
              title: Text('Khám phá'),
              inactiveColor: Colors.grey[400],
              activeColor: Colors.amber,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(EvaIcons.bookOpen, size: 20),
              title: Text('Tủ sách'),
              inactiveColor: Colors.grey[400],
              activeColor: Colors.amber,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(EvaIcons.people, size: 20),
              title: Text('Nhóm truyện'),
              inactiveColor: Colors.grey[400],
              activeColor: Colors.amber,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.settings, size: 20),
              title: Text('Cài đặt'),
              inactiveColor: Colors.grey[400],
              activeColor: Colors.amber,
              textAlign: TextAlign.center,
            ),
          ]))
    );
  }
}
