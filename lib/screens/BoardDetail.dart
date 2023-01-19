import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class BoardDetail extends StatefulWidget {
  const BoardDetail({Key? key}) : super(key: key);
  static const routename = '/BoardDetail';

  @override
  State<BoardDetail> createState() => _BoardDetail();
}

class _BoardDetail extends State<BoardDetail> {
  @override
  Widget build(BuildContext context) {
    /// TODO Backend 완성 후 수정
    // Variables
    List<String> files = ["file1.png", "file2.pdf", "files3.mp3", "files4.sh"];
    int btnBg = 0xffffffff;
    int btnTxtColor = 0xffff0000;
    double valPadding = 32.0;
    String date = "2023.01.19";
    String content = "정리노트\n\nhttps://google.com\n\n좋은 하루 되시길";
    List<Map<dynamic, dynamic>> testReply = [
      {
        "name": "익명",
        "reply": "테스트",
        "date": "2023.01.19",
      },
      {
        "name": "익명2",
        "reply": "테스트2",
        "date": "2023.01.20",
      },
      {
        "name": "익명3",
        "reply": "테스트3",
        "date": "2023.01.21",
      },
    ];

    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: valPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset("images/icons/img.png")),
                GestureDetector(
                    onTap: () {
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
                      "삭제하기",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 22,
                        color: Color(btnTxtColor),
                      ),
                    )),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: valPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text(
                  "현장프로젝트 정리 노트",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 30
                  ),
                ),
                Text(
                  "익명",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: valPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  content,
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  "첨부파일",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: files.length,
                    itemBuilder: (context, idx) {
                      return GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(
                              msg: "Download ${files[idx]}",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.grey,
                              textColor: Colors.black,
                              fontSize: 16.0);
                        },
                        child: Text(
                          files[idx],
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      );
                    }),
                const SizedBox(height: 40),
                const Divider(
                    height: 1,
                    color: Color.fromRGBO(219, 219, 219, 1),
                    thickness: 1),
                const SizedBox(height: 40),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: testReply.length,
                    itemBuilder: (context, idx) {
                      return GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(
                              msg: "Download ${files[idx]}",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.grey,
                              textColor: Colors.black,
                              fontSize: 16.0);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  testReply[idx]['name'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  testReply[idx]['reply'],
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 15),
                              ],
                            ),
                            Text(
                              testReply[idx]['date'],
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class tb_reply {
  String? name;
  String? content;
  String? date;

  tb_reply({
    this.name,
    this.content,
    this.date,
  });

  tb_reply.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    content = json['content'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['content'] = this.content;
    data['date'] = this.date;
    return data;
  }
}
