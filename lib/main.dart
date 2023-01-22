import 'package:descend/view/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:descend/screens/CreateBoardScreen.dart';
import 'package:descend/screens/BoardDetail.dart';

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
      initialRoute: '/',
      routes: {
        // '/':(context) => CreateBoardScreen(),
        '/':(context) => BoardDetail(),
        // '/':(context) => LoginScreen(),
        // SpaceSelect.routename: (context) => SpaceSelect(),
        // SpaceListScreen.routename: (context) => SpaceListScreen(),
        // SpecificScreen.routename : (context) => SpecificScreen(),
        // ReservationScreen.routename : (context) => ReservationScreen(),
        // ReservationList.routename : (context) => ReservationList(),
        // ResultScreen.routename : (context) => ResultScreen(),
      },
    );
  }
}
