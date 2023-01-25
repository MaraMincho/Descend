import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoBack extends StatelessWidget {
  const GoBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {Get.back();},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 25, 10, 20),
        child: Container(
            alignment: Alignment.topLeft,
            child: Icon(Icons.arrow_back,
              color: Colors.black,
              size: 40,
            )
        ),
      ),
    );
  }
}
