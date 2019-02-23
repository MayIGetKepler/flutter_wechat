import 'package:flutter/material.dart';
import '../widget/full_width_button.dart';

class DiscoverPage extends StatelessWidget {
  static const double SEPARATE_SIZE = 20;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: SEPARATE_SIZE),
          FullWidthButton(
            iconPath: 'assets/images/ic_social_circle.png',
            text: '朋友圈',
            onPressed: () {
              print('点击了朋友圈');
            },
          ),
          SizedBox(height: SEPARATE_SIZE),
          FullWidthButton(
            iconPath: 'assets/images/ic_quick_scan.png',
            text: '扫一扫',
            showDivider: true,
            onPressed: () {
              print('点击了扫一扫');
            },
          ),
          FullWidthButton(
            iconPath: 'assets/images/ic_shake_phone.png',
            text: '摇一摇',
            onPressed: () {
              print('点击了摇一摇');
            },
          ),
          SizedBox(height: SEPARATE_SIZE),
          FullWidthButton(
            iconPath: 'assets/images/ic_feeds.png',
            text: '看一看',
            showDivider: true,
            onPressed: () {
              print('点击了看一看');
            },
          ),
          FullWidthButton(
            iconPath: 'assets/images/ic_quick_search.png',
            text: '搜一搜',
            onPressed: () {
              print('点击了搜一搜');
            },
          ),
          SizedBox(height: SEPARATE_SIZE),
          FullWidthButton(
            iconPath: 'assets/images/ic_people_nearby.png',
            text: '附近的人',
            showDivider: true,
            onPressed: () {
              print('点击了附近的人');
            },
          ),
          FullWidthButton(
            iconPath: 'assets/images/ic_bottle_msg.png',
            text: '漂流瓶',
            onPressed: () {
              print('点击了漂流瓶');
            },
          ),
          SizedBox(height: SEPARATE_SIZE),
          FullWidthButton(
            iconPath: 'assets/images/ic_shopping.png',
            text: '购物',
            showDivider: true,
            onPressed: () {
              print('点击了购物');
            },
          ),
          FullWidthButton(
            iconPath: 'assets/images/ic_game_entry.png',
            text: '游戏',
            onPressed: () {
              print('点击了游戏');
            },
          ),
          SizedBox(height: SEPARATE_SIZE),
          FullWidthButton(
            iconPath: 'assets/images/ic_mini_program.png',
            text: '小程序',
            onPressed: () {
              print('点击了小程序');
            },
          ),
          SizedBox(height: SEPARATE_SIZE),
        ],
      ),
    );
  }
}
