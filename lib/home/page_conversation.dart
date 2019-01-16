import 'package:flutter/material.dart';
import '../model/conversation.dart'
    show mockConversationData, Conversation, Device;
import 'package:flutter_wechat/constants.dart';

class ConversationPage extends StatefulWidget {
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage>
    with AutomaticKeepAliveClientMixin {
  List<Conversation> conversations = mockConversationData['conversation'];
  Device device = mockConversationData['device'];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (device != null) {
          if (index == 0) {
            return DeviceInfoItem(device);
          } else {
            return ConversationWidget(conversations[index - 1]);
          }
        } else {
          return ConversationWidget(conversations[index]);
        }
      },
      itemCount:
          device == null ? conversations.length : conversations.length + 1,
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ConversationWidget extends StatefulWidget {
  _ConversationWidgetState createState() => _ConversationWidgetState();

  final Conversation _conversation;
  ConversationWidget(this._conversation);
}

class _ConversationWidgetState extends State<ConversationWidget> {
  Conversation conversationItem;
  List<Widget> _timeZone;
  Widget avatarStack;

  @override
  void initState() {
    super.initState();
    conversationItem = widget._conversation;
  }

  @override
  Widget build(BuildContext context) {
    //时间区域 静音图标的设置
    _timeZone = [
      Text(
        conversationItem.updateAt,
        style: AppStyles.DesStyle,
      ),
      SizedBox(
        height: 10,
      ),
    ];
    _timeZone.add(Icon(
      IconData(
        0xef3e,
        fontFamily: Constants.IconFontFamily,
      ),
      size: Constants.ConversationMuteIconSize,
      color: conversationItem.isMute
          ? Color(AppColors.ConversationMuteIcon)
          : Colors.transparent,
    ));

    //头像区域 未读消息红点的设置
    if (conversationItem.unreadMessage > 0) {
      avatarStack = Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          avatarWidget(conversationItem),
          Positioned(
              right: -6.0,
              top: -6.0,
              child: unreadMessageDot(conversationItem.unreadMessage)),
        ],
      );
    } else {
      avatarStack = avatarWidget(conversationItem);
    }

    return Container(
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(AppColors.DividerColor)))),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(padding: EdgeInsets.all(8.0), child: avatarStack),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    conversationItem.title,
                    style: AppStyles.TitleStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    conversationItem.des,
                    style: AppStyles.DesStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 8.0, 0),
              child: Column(children: _timeZone),
            )
          ]),
    );
  }
}

//根据地址类型生成头像
Widget avatarWidget(Conversation conversationItem) =>
    conversationItem.isAvatarFromNet()
        ? Image.network(
            conversationItem.avatar,
            width: Constants.ConversationAvatarSize,
            height: Constants.ConversationAvatarSize,
          )
        : Image.asset(
            conversationItem.avatar,
            width: Constants.ConversationAvatarSize,
            height: Constants.ConversationAvatarSize,
          );

//未读消息红点
Widget unreadMessageDot(int unreadMessageCount) => Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(Constants.UnReadMsgNotifyDotSize / 2),
          color: Color(AppColors.NotifyDotBg)),
      width: Constants.UnReadMsgNotifyDotSize,
      height: Constants.UnReadMsgNotifyDotSize,
      child: Text(
        unreadMessageCount.toString(),
        style: AppStyles.UnreadMsgCountDotStyle,
      ),
    );

class DeviceInfoItem extends StatefulWidget {
  _DeviceInfoItemState createState() => _DeviceInfoItemState();
  final Device _device;
  DeviceInfoItem(this._device) : assert(_device != null);

  String get deviceName {
    return _device == Device.WIN ? 'Windows' : "Mac";
  }

  int get deviceIcon {
    return _device == Device.WIN ? 0xe686 : 0xe60d;
  }
}

//电脑设备登录信息
class _DeviceInfoItemState extends State<DeviceInfoItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
      decoration: BoxDecoration(
          color: Color(AppColors.DeviceInfoItemBg),
          border:
              Border(bottom: BorderSide(color: Color(AppColors.DividerColor)))),
      child: Row(
        children: <Widget>[
          Icon(
            IconData(widget.deviceIcon, fontFamily: Constants.IconFontFamily),
            color: Color(AppColors.DeviceInfoItemIcon),
            size: 30,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            '${widget.deviceName} 微信已登录，手机通知已关闭',
            style: AppStyles.DeviceInfoItemTextStyle,
          )
        ],
      ),
    );
  }
}
