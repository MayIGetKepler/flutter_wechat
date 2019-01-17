import 'package:flutter/material.dart';
import '../constants.dart';

enum Device { WIN, Mac }

class Conversation {
  final String avatar;
  final String title;
  final int titleColor;
  final String des;
  final bool isMute;
  final String updateAt;
  final int unreadMessage;
  final bool isPlayDot;

  const Conversation(
      {this.avatar: 'assets/images/default_nor_avatar.png',
      @required this.title,
      this.titleColor: AppColors.TitleTextColor,
      this.des,
      this.isMute: false,
      @required this.updateAt,
      this.unreadMessage: 0,
      this.isPlayDot: false})
      : assert(title != null),
        assert(updateAt != null);

  bool isAvatarFromNet() {
    return this.avatar.toLowerCase().startsWith('http');
  }
}

class ConversationPageData {
  final Device device;
  final List<Conversation> conversations;
  ConversationPageData({this.device, this.conversations});

  static ConversationPageData mock() {
    return ConversationPageData(
        device: Device.WIN, conversations: _mockConversations);
  }
}

const List<Conversation> _mockConversations = [
  const Conversation(
    avatar: 'assets/images/ic_file_transfer.png',
    title: '文件传输助手',
    des: '',
    updateAt: '19:56',
  ),
  Conversation(
      avatar: 'assets/images/ic_tx_news.png',
      title: '腾讯新闻',
      des: '悬崖边刹不住车 他撞山就下一家5口',
      updateAt: '10:33',
      unreadMessage: 1),
  Conversation(
    avatar: 'assets/images/ic_fengchao.png',
    title: '蜂巢智能柜',
    des: '喷一喷，竟比洗牙还神奇！5秒钟还你一个漂亮洁白的口腔。',
    updateAt: '17:12',
  ),
  Conversation(
      avatar: 'https://randomuser.me/api/portraits/lego/4.jpg',
      title: '乐高一号',
      des: '今晚吃什么',
      updateAt: '18:55',
      isMute: true,
      unreadMessage: 3),
  Conversation(
    avatar: 'https://randomuser.me/api/portraits/lego/3.jpg',
    title: '医生乐高',
    des: '你康复了吗',
    updateAt: '昨天',
  ),
  Conversation(
    avatar: 'https://randomuser.me/api/portraits/lego/7.jpg',
    title: '乐高建筑师',
    des: '我要建一间大房子',
    updateAt: '22:10',
  ),
  Conversation(
    avatar: 'https://randomuser.me/api/portraits/lego/8.jpg',
    title: '乐高厨师',
    des: '今晚吃Pizza可以吗',
    updateAt: '15:30',
  ),
  Conversation(
      avatar: 'https://randomuser.me/api/portraits/lego/5.jpg',
      title: '乐高理发师',
      des: '你好，我是托尼老师',
      updateAt: '10:38',
      unreadMessage: 99),
  Conversation(
    avatar: 'https://randomuser.me/api/portraits/lego/6.jpg',
    title: '墨西哥乐高',
    des: '想吃墨西哥鸡肉卷吗~',
    updateAt: '14:16',
  ),
];
