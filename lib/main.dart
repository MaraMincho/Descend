import 'package:descend/view/Login/login.dart';
import 'package:descend/view/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  return runApp(MyApp());
}
final GlobalKey<ScaffoldState> key = GlobalKey();

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( //get
      title: 'Seegong',
      theme: ThemeData(
        fontFamily: 'Pretendard',
        primarySwatch: Colors.indigo,
        primaryColor: Color(0xffffffff),
      ),
      home: SplashScreen()
    );
  }
}
