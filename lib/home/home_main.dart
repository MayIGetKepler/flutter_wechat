import 'package:flutter/material.dart';
import '../constants.dart' show AppColors, Constants;
import 'page_conversation.dart';
import 'page_contact.dart';
import 'page_discover.dart';
import 'page_mine.dart';

class Home_Main extends StatefulWidget {
  _Home_MainState createState() => _Home_MainState();
}

class _Home_MainState extends State<Home_Main> {
  List<NavigationIconView> _navigationViews;
  PageController _pageController;
  List<Widget> _pages;
  var _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _navigationViews = [
      NavigationIconView(
          title: '微信',
          icon: IconData(0xe603, fontFamily: Constants.IconFontFamily),
          activeIcon: IconData(0xe621, fontFamily: Constants.IconFontFamily)),
      NavigationIconView(
          title: '通讯录',
          icon: IconData(0xe602, fontFamily: Constants.IconFontFamily),
          activeIcon: IconData(0xe955, fontFamily: Constants.IconFontFamily)),
      NavigationIconView(
          title: '发现',
          icon: IconData(0xe6b9, fontFamily: Constants.IconFontFamily),
          activeIcon: IconData(0xe6ea, fontFamily: Constants.IconFontFamily)),
      NavigationIconView(
          title: '我',
          icon: IconData(0xe600, fontFamily: Constants.IconFontFamily),
          activeIcon: IconData(0xe604, fontFamily: Constants.IconFontFamily)),
    ];

    _pageController = PageController();
    _pages = [
      ConversationPage(),
      ContactPage(),
      DiscoverPage(),
      MinePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavBar = BottomNavigationBar(
      items:
          _navigationViews.map((NavigationIconView view) => view.item).toList(),
      onTap: (index) {
        setState(() {
          _currentIndex = index;
          _pageController.jumpToPage(index);
        });
      },
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      fixedColor: Color(AppColors.BottomActiveColor),
    );
    return Scaffold(
        appBar: AppBar(
          title: Text('微信'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                IconData(0xe954, fontFamily: Constants.IconFontFamily),
                size: 20,
              ),
              onPressed: () {},
            ),
            SizedBox(
              width: 20,
            ),
            PopupMenuButton(
              icon: Icon(IconData(0xe620, fontFamily: Constants.IconFontFamily),
                  size: 18),
              itemBuilder: (context) {},
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        body: PageView.builder(
          onPageChanged: (index){
            setState(()=>_currentIndex=index);
          },
          controller: _pageController,
          itemCount: _pages.length,
          itemBuilder: (context, index) {
            return _pages[index];
          },
        ),
        bottomNavigationBar: bottomNavBar);
  }
}

class NavigationIconView {
  final BottomNavigationBarItem item;
  NavigationIconView(
      {key: Key, String title, IconData icon, IconData activeIcon})
      : item = BottomNavigationBarItem(
            title: Text(title),
            icon: Icon(icon),
            activeIcon: Icon(activeIcon));
}