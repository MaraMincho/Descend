import 'package:descend/view/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class DummyPage extends StatefulWidget {
  DummyPage({Key? key}) : super(key: key);

  @override
  State<DummyPage> createState() => _test2State();
}

class _test2State extends State<DummyPage> {

  @override
  Widget build(BuildContext context) {
    setState(() {
      Future.delayed(const Duration(milliseconds: 1000), () {
        Get.to(MainScreen());
      });
    });
    return Container();
  }
}
