import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CreateBoardScreen extends StatefulWidget {
  const CreateBoardScreen({Key? key}) : super(key: key);
  static const routename = '/CreateBoardScreen';

  @override
  State<CreateBoardScreen> createState() => _SpecificScreenState();
}

class _SpecificScreenState extends State<CreateBoardScreen> {
  @override
  Widget build(BuildContext context) {
    List <String> files = ["fil1.png", "file2.pdf", "files3.mp3"];

    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: <Widget>[
          Column(
            children: const [
              TextField(
                decoration: InputDecoration(
                  hintText: "현장프로젝트 교과",
                ),
              ),
              TextField(
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "내용을 입력하세요",
                  contentPadding: EdgeInsets.only(bottom: 100),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Fluttertoast.showToast(
                  msg: "Pressed : Add file button",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.grey,
                  textColor: Colors.black,
                  fontSize: 16.0);
            },
            child: Text("첨부파일 추가하기"),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: ListView.builder(
                itemCount: files == null ? 0 : files.length,
                itemBuilder: (context, idx) {
                  return GestureDetector(
                    onTap: () {
                      files.removeAt(idx);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        child: Text("${files[idx]}"),
                      ),
                    ),
                  );
                }),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.black,
              width: 1,
            )),
            child: Container(child: Image.asset('images/imgs/img.png')),
          ),
        ],
        // child: Image.asset("assets/images/glob_top_img_none.png",
      ),
    ));
  }
}
