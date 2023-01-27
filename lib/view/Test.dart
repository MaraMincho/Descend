import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){
                Get.snackbar(
                 '저장버튼 클릭했습니다!',
                  '축하합니다. 저장버튼입니다.',
                  snackPosition: SnackPosition.BOTTOM
                );
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('123'), duration:Duration(milliseconds: 250) ,));
              },
              icon: Icon(Icons.abc, size: 35,))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          keyboardType: TextInputType.multiline,
          minLines: null,
          maxLines: null,
          expands: true,
          decoration: InputDecoration(
            filled: false
          ),
        ),
      ),
    );
  }
}
