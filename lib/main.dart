import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home/home_main.dart';
import 'constants.dart' show AppColors;

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SystemUiOverlayStyle style =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(style);
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Theme.of(context)
            .copyWith(primaryColor: Color(AppColors.AppBarColor),
            cardColor: Color(0xff373B3E)),
        home: Home_Main(),
    );
  }
}


