import 'package:flutter/material.dart';
import '../model/contact.dart';
import '../constants.dart';

class ContactPage extends StatefulWidget {
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  List<Contact> _contacts = [];
  List<ContactItem> _functionItems;

  @override
  void initState() {
    super.initState();
    _contacts
      ..addAll(ContactPageData.mock().contacts)
      ..addAll(ContactPageData.mock().contacts);
    _contacts.sort((Contact a, Contact b) {
      return a.nameIndex.compareTo(b.nameIndex);
    });

    _functionItems = [
      ContactItem(
        Contact(
          avatar: 'assets/images/ic_new_friend.png',
          name: '新的朋友',
        ),
        onPressed: () {
          print('新的朋友');
        },
      ),
      ContactItem(
          Contact(
            avatar: 'assets/images/ic_group_chat.png',
            name: '群聊',
          ), onPressed: () {
        print('新的朋友');
      }),
      ContactItem(
          Contact(
            avatar: 'assets/images/ic_tag.png',
            name: '标签',
          ), onPressed: () {
        print('新的朋友');
      }),
      ContactItem(
          Contact(
            avatar: 'assets/images/ic_public_account.png',
            name: '公众号',
          ), onPressed: () {
        print('新的朋友');
      }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        //固定的功能item
        if (index < _functionItems.length) {
          return _functionItems[index];
        }
        //联系人item
        var _currentIndex = index - _functionItems.length;
        bool _hasTitle = true;
        //如果当前不是第一项，且当前项索引等于上一项索引，不显示title
        if (_currentIndex > 0 &&
            _contacts[_currentIndex].nameIndex ==
                _contacts[_currentIndex - 1].nameIndex) {
          _hasTitle = false;
        }
        return ContactItem(
          _contacts[_currentIndex],
          hasTitle: _hasTitle,
        );
      },
      itemCount: _contacts.length + _functionItems.length,
    );
  }
}

class ContactItem extends StatelessWidget {
  final Contact _contact;
  final bool hasTitle;
  final VoidCallback onPressed;
  ContactItem(this._contact, {this.onPressed, this.hasTitle: false});

  @override
  Widget build(BuildContext context) {
    return itemWidget();
  }

  Widget itemWidget() {
    if (hasTitle) {
      return itemHeader() == null
          ? itemBody()
          : Column(
              children: <Widget>[
                itemHeader(),
                itemBody(),
              ],
            );
    } else {
      return itemBody();
    }
  }

//联系人头部 -> 索引
  Widget itemHeader() {
    if (_contact.nameIndex != null) {
      return Container(
        padding: EdgeInsets.only(left: 16, top: 4, bottom: 4),
        alignment: Alignment.centerLeft,
        child: Text(
          _contact.nameIndex,
          style: AppStyles.GroupTitleItemTextStyle,
        ),
        color: Color(AppColors.ContactGroupTitleBg),
      );
    }
    return null;
  }

//联系人主体
  Widget itemBody() =>  Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: Color(AppColors.DividerColor),
          ))),
          child: Row(
            children: <Widget>[
              avatar(),
              SizedBox(
                width: 10,
              ),
              Text(
                _contact.name,
                style: AppStyles.TitleStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
      
      );

//头像
  Widget avatar() {
    return _contact.isAvatarFromNet()
        ? Image.network(
            _contact.avatar,
            width: Constants.ContactAvatarSize,
            height: Constants.ContactAvatarSize,
          )
        : Image.asset(
            _contact.avatar,
            width: Constants.ContactAvatarSize,
            height: Constants.ContactAvatarSize,
          );
  }
}
