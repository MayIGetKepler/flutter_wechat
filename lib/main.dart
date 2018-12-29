import 'package:flutter/material.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: MaterialApp(
         home: Scaffold(
           appBar: AppBar(title: Text('data'),),
           body: Center(
             child: Container(child: Icon(IconData(0xe69e,fontFamily:"iconfont"),color: Colors.amber,size: 50,))
           ),
         ),
       ),
    );
  }
}