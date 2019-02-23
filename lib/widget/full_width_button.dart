import 'package:flutter/material.dart';
import 'package:flutter_wechat/constants.dart' show AppColors, Constants;

class FullWidthButton extends StatelessWidget {
  static const double HORIZONTAL_PADDING = 10.0;
  static const double VERTICAL_PADDING = 5.0;

  FullWidthButton(
      {this.iconPath,
      this.text,
      this.note: '',
      this.showDivider: false,
      this.onPressed})
      : assert(iconPath != null),
        assert(text != null),
        assert(onPressed != null);

  final String iconPath;
  final String text;
  final String note;
  final bool showDivider;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    Widget _buttonBody = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          iconPath,
          width: Constants.FullWidthIconSize,
          height: Constants.FullWidthIconSize,
        ),
        SizedBox(
          width: HORIZONTAL_PADDING,
        ),
        Text(text),
        Expanded(
          child: SizedBox(),
        ),
        Text(
          note,
          style: TextStyle(color: Color(AppColors.DesTextColor)),
          textAlign: TextAlign.end,
        ),
        Container(
            width: 30,
            child: IconButton(
              icon: Icon(
                Icons.keyboard_arrow_right,
              ),
              onPressed: () {},
              color: Colors.grey,
              padding: EdgeInsets.all(0),
              alignment: Alignment.centerRight,
            ))
      ],
    );
    Widget _buttonView = FlatButton(
      color: Colors.white,
      onPressed: onPressed,
      padding: EdgeInsets.symmetric(
        horizontal: HORIZONTAL_PADDING,
      ),
      child:  _buttonBody,
    );

    if (showDivider) {
     return  Column(
        children: <Widget>[_buttonView, Divider(height: 1,indent: 40,)],
      );
    }else{
      return _buttonView;
    }
  }
}
