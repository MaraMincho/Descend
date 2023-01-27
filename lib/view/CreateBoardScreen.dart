import 'package:descend/view/SubjectDetailScreen.dart';
import 'package:descend/view/widget/GoBack.dart';
import 'package:descend/viewmodel/FeedViewModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CreateBoardScreen extends StatefulWidget {

  const CreateBoardScreen({Key? key}) : super(key: key);
  static const routename = '/CreateBoardScreen';

  @override
  State<CreateBoardScreen> createState() => _CreateBoardScreen();
}

class _CreateBoardScreen extends State<CreateBoardScreen> {
  @override
  Widget build(BuildContext context) {


    var feedViewModel = Get.put(FeedViewModel());
    // Variables
    int btnBg = 0xffD69595;
    int btnTxtColor = 0xff000000;
    double valPadding = 32.0;

    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: valPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GoBack(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(btnBg),
                    ),
                    onPressed: () async {
                      await feedViewModel.createBoard();
                      feedViewModel.title.text ="";
                      feedViewModel.content.text = "";
                      Get.off(SubjectDetailScreen());
                    },
                    child: Text(
                      "완료",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(btnTxtColor),
                      ),
                    )),
              ],
            ),
          ),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: valPadding),
              child: Column(
                children: [
                  Text(
                    "${feedViewModel.currentSubject?.subname}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  TextField(
                    controller: feedViewModel.title,
                    decoration: InputDecoration(
                      hintText: "제목",
                    ),
                  ),
                  TextField(
                    maxLines: null,
                    controller: feedViewModel.content,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "내용을 입력하세요",
                      contentPadding: EdgeInsets.only(top: 10, bottom: 140),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    ));
  }
}
