import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mangoto/src/consts/custom_color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mangoto/src/controllers/home_controller.dart';
import 'package:mangoto/src/ui/detail_comic_ui.dart';
import 'package:mangoto/src/ui/setting_ui%08.dart';
import 'package:get/instance_manager.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    this.controller.fetchApi();
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    controller.setContext(context);

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 8.0),
            child: CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.3,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayAnimationDuration: Duration(milliseconds: 900),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              items: [
                'https://i.pinimg.com/originals/c2/7f/62/c27f62a526caf8b3fcc59525fd1a13d4.jpg',
                'https://top.trangdangtin.com/htdocs/images/news/2020/03/14/800/who_made_a_princess.jpg',
                'https://cantigamusic.com/wp-content/uploads/2019/08/7-5.jpg'
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          alignment: Alignment.center,
                          fit: StackFit.passthrough,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              child: Container(
                                child: Image.network(
                                  i,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin:
                                  const EdgeInsets.only(right: 10.0, top: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                    child: Text(
                                      'Tập: 102',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    width: 130.0,
                                    alignment: Alignment(0, 0),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomLeft,
                              margin: const EdgeInsets.only(
                                  left: 20.0, bottom: 30.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white.withOpacity(0.9),
                                    ),
                                    child: Obx(() => Text(
                                          '${controller.count.value}',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w500),
                                        )),
                                    width: 130.0,
                                    alignment: Alignment(0, 0),
                                  )
                                ],
                              ),
                            )
                          ],
                        ));
                  },
                );
              }).toList(),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Column(
              children: [
                IconButton(
                  icon: Image.asset('lib/assets/images/envelope.png'),
                  iconSize: 40,
                  onPressed: () {},
                ),
                Text(
                  'Thông báo',
                  style: TextStyle(color: Colors.grey[500], fontSize: 12.0),
                )
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: Image.asset('lib/assets/images/chart.png'),
                  iconSize: 40,
                  onPressed: () {},
                ),
                Text(
                  'Top truyện',
                  style: TextStyle(color: Colors.grey[500], fontSize: 12.0),
                )
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: Image.asset('lib/assets/images/trolley.png'),
                  iconSize: 40,
                  onPressed: () {},
                ),
                Text(
                  'Cửa hàng',
                  style: TextStyle(color: Colors.grey[500], fontSize: 12.0),
                )
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: Image.asset('lib/assets/images/present-box.png'),
                  iconSize: 40,
                  onPressed: () {},
                ),
                Text(
                  'Quà tặng',
                  style: TextStyle(color: Colors.grey[500], fontSize: 12.0),
                )
              ],
            )
          ]),
          Container(
            child: Obx(() => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: controller.renderListComics().toList())),
          ),
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
