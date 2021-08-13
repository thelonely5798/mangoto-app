import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mangoto/src/models/example_model.dart';
import 'package:mangoto/src/ui/search_comic_ui.dart';
import 'package:mangoto/src/ui/home_ui.dart';
import 'package:mangoto/src/ui/setting_ui%08.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber),
        scaffoldBackgroundColor: HexColor("#ffffff"),
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white))),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int _selectedIndex = 0;

  final List<StatefulWidget> _widgetOptions = <StatefulWidget>[
    HomePage(),
    SearchComic(),
    SettingPage(),
    HomePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: _widgetOptions.elementAt(_selectedIndex),
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
      ),
      bottomNavigationBar: BottomNavyBar(
          selectedIndex: _selectedIndex,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: (index) => setState(() => _selectedIndex = index),
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
          ]),
    );
  }
}
