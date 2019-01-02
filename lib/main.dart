import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart' show AppColors;

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SystemUiOverlayStyle style =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  List<NavigationIconView> _navigationViews;
  var _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _navigationViews = [
      NavigationIconView(
          title: '微信', icon: IconData(0xe603, fontFamily: 'appIconFont'),activeIcon: IconData(0xe621, fontFamily: 'appIconFont')),
      NavigationIconView(
          title: '通讯录', icon: IconData(0xe602, fontFamily: 'appIconFont'),activeIcon: IconData(0xe955, fontFamily: 'appIconFont')),
      NavigationIconView(
          title: '发现', icon: IconData(0xe6b9, fontFamily: 'appIconFont'),activeIcon: IconData(0xe6ea, fontFamily: 'appIconFont')),
      NavigationIconView(
          title: '我', icon: IconData(0xe600, fontFamily: 'appIconFont'),activeIcon: IconData(0xe604, fontFamily: 'appIconFont')),
    ];
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(style);
    final BottomNavigationBar bottomNavBar = BottomNavigationBar(
        items: _navigationViews.map((NavigationIconView view)=>view.item).toList(),
      onTap: (index) {setState(() {
              _currentIndex = index;
            });},
      currentIndex:_currentIndex,
      type: BottomNavigationBarType.fixed,
      fixedColor: Color(0xff43C118),
    );
    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Theme.of(context)
            .copyWith(primaryColor: Color(AppColors.AppBarColor)),
        home: Scaffold(
            appBar: AppBar(
              title: Text('微信'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    IconData(0xe954, fontFamily: 'appIconFont'),
                    size: 20,
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 20,
                ),
                PopupMenuButton(
                  icon: Icon(IconData(0xe620, fontFamily: 'appIconFont'),
                      size: 18),
                  itemBuilder: (context) {},
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            body: Center(
                child: Container(
                    child: Icon(
              IconData(0xe69e, fontFamily: "appIconFont"),
              color: Colors.amber,
              size: 50,
            ))),
            bottomNavigationBar: bottomNavBar),
      ),
    );
  }
}

class NavigationIconView {
  final BottomNavigationBarItem item;
  NavigationIconView(
      {key: Key, String title, IconData icon, IconData activeIcon})
      : item = BottomNavigationBarItem(
          title: Text(title,),
          icon: Icon(icon,),
          activeIcon: Icon(activeIcon,)
        );
}
