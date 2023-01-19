import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    List<String> files = ["file1.png", "file2.pdf", "files3.mp3", "files4.sh"];

    // Variables
    int btnBg = 0xffD69595;
    int btnTxtColor = 0xff000000;
    double valPadding = 32.0;

    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: valPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset("images/icons/img.png")),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(btnBg),
                    ),
                    onPressed: () {
                      Fluttertoast.showToast(
                          msg: "Pressed : Submit",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey,
                          textColor: Colors.black,
                          fontSize: 16.0);
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
                children: const [
                  Text(
                    "현장 프로젝트 교과",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "제목",
                    ),
                  ),
                  TextField(
                    maxLines: null,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "내용을 입력하세요",
                      contentPadding: EdgeInsets.only(top: 10, bottom: 140),
                    ),
                  ),
                ],
              ),
            ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 120),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(btnBg),
              ),
              onPressed: () {
                Fluttertoast.showToast(
                    msg: "Pressed : Add file",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.grey,
                    textColor: Colors.black,
                    fontSize: 16.0);
              },
              child: Text(
                "첨부파일 추가하기",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(btnTxtColor),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: valPadding),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: files.length,
                itemBuilder: (context, idx) {
                  return GestureDetector(
                    onTap: () {
                      /// TODO 업데이트 안됨...
                      setState(() {
                        files.removeAt(idx);
                      });
                      Fluttertoast.showToast(
                          msg: "Deleted file",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey,
                          textColor: Colors.black,
                          fontSize: 16.0);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text("${files[idx]}"),
                    ),
                  );
                }),
          ),
        ],
      ),
    ));
  }
}
