import 'package:flutter/material.dart';
import '../model/contact.dart';
import '../constants.dart';

const INDEX_BAR_WORDS = [
  "↑",
  "☆",
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z"
];

class ContactPage extends StatefulWidget {
  Color _indexBarGg = Colors.transparent;
  String _currentLetter = '';
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  List<Contact> _contacts = [];
  List<ContactItem> _functionItems;
  List<Widget> _body;
  ScrollController _scrollController;
  Map _indexPositionMap = {INDEX_BAR_WORDS[0]: 0.0};

  var _totalHeight = 0.0;

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

    _scrollController = ScrollController();
    //计算index坐标
    computeIndexPos();
  }

  computeIndexPos() {
    _totalHeight += _functionItems.length * ContactItem._itemHeight(false);
    for (var i = 0; i < _contacts.length; i++) {
      bool hasTitle = true;
      if (i > 0 && _contacts[i].nameIndex == _contacts[i - 1].nameIndex) {
        hasTitle = false;
      }
      if (hasTitle) {
        _indexPositionMap[_contacts[i].nameIndex] = _totalHeight;
      }
      _totalHeight += ContactItem._itemHeight(hasTitle);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

//获取当前位置的索引值
  String _getLetter(
      BuildContext context, double tileHeight, Offset globalPositon) {
    RenderBox renderBox = context.findRenderObject();
    Offset local = renderBox.globalToLocal(globalPositon);
    var index = (local.dy ~/ tileHeight).clamp(0, INDEX_BAR_WORDS.length - 1);
    return INDEX_BAR_WORDS[index];
  }

//页面滑动到索引位置
  _jumpToIndex(Curve curve){
    if(_indexPositionMap!=null && _indexPositionMap.containsKey(widget._currentLetter)){
      _scrollController.animateTo(_indexPositionMap[widget._currentLetter],
            curve: curve, duration: Duration(milliseconds: 300));
    }
  }

//索引Bar
  Widget _indexBarBulider(BuildContext context, BoxConstraints constraints) {
    //索引Bar的最高高度
    final double _barTotalHeight = constraints.biggest.height;
    //索引Bar每一个字符的高度
    final double _barTileHeight = _barTotalHeight / INDEX_BAR_WORDS.length;

    return GestureDetector(
      onVerticalDragDown: (DragDownDetails details) {
        setState(() {
          widget._indexBarGg = Colors.black26;
          widget._currentLetter =
              _getLetter(context, _barTileHeight, details.globalPosition);
        });
        _jumpToIndex(Curves.easeInOut);
      },
      onVerticalDragEnd: (DragEndDetails details) {
        setState(() {
          widget._indexBarGg = Colors.transparent;
          widget._currentLetter = '';
        });
      },
      onVerticalDragCancel: () {
        setState(() {
          widget._indexBarGg = Colors.transparent;
          widget._currentLetter = '';
        });
      },
      onVerticalDragUpdate: (DragUpdateDetails details) {
        setState(() {
          widget._currentLetter =
              _getLetter(context, _barTileHeight, details.globalPosition);
              
        });
        _jumpToIndex(Curves.fastOutSlowIn);
      },
      child: Column(
        children: buildIndexBar(),
      ),
    );
  }

  List<Widget> buildIndexBar() {
    return INDEX_BAR_WORDS.map((String word) {
      return Expanded(
        child: Text(word),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    _body = [
      ListView.builder(
        controller: _scrollController,
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
      ),
      Positioned(
        right: 0,
        top: 0,
        bottom: 0,
        width: 20,
        child: Container(
          color: widget._indexBarGg,
          child: LayoutBuilder(
            builder: _indexBarBulider,
          ),
        ),
      ),
    ];
    //根据_currentLetter的内容是不是空，判断是否添加中间显示索引的控件
    if (widget._currentLetter != null && widget._currentLetter.isNotEmpty) {
      _body.add(Center(
        child: Container(
          width: Constants.IndexLetterBoxSize,
          height: Constants.IndexLetterBoxSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Constants.IndexLetterBoxRadius),
               color: AppColors.IndexLetterBoxBg),
          child: Text(widget._currentLetter,style: AppStyles.IndexLetterBoxTextStyle,),
        ),
      ));
    }
    return Stack(
      children: _body,
    );
  }
}

class ContactItem extends StatelessWidget {
  final Contact _contact;
  final bool hasTitle;
  final VoidCallback onPressed;
  ContactItem(this._contact, {this.onPressed, this.hasTitle: false});

  static const MARGIN_VERTICAL = 10.0;
  static const GROUP_TITLE_HEIGHT = 24.0;

  static double _itemHeight(bool hasTitle) {
    //itemBody高度
    var itemHeiht = Constants.ContactAvatarSize + MARGIN_VERTICAL * 2 + 1;

    return hasTitle ? itemHeiht + GROUP_TITLE_HEIGHT : itemHeiht;
  }

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
        height: GROUP_TITLE_HEIGHT,
        padding: EdgeInsets.only(left: 16),
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
  Widget itemBody() => Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.symmetric(vertical: MARGIN_VERTICAL),
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
