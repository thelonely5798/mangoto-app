import 'package:get/get.dart';
import 'package:mangoto/src/ui/detail_comic_ui.dart';
import 'package:mangoto/src/ui/home_ui.dart';
import 'package:mangoto/src/ui/main_ui.dart';
import 'package:mangoto/src/ui/search_comic_ui.dart';
import 'package:mangoto/src/ui/setting_ui%08.dart';

class Routes {
  final pages = [
    GetPage(name: '/', page: () => MainPage(),),
  ];
}
