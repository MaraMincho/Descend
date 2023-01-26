import 'package:descend/view/SubjectDetailScreen.dart';
import 'package:descend/view/widget/GoBack.dart';
import 'package:descend/view/widget/UpdateBoard.dart';
import 'package:descend/viewmodel/FeedViewModel.dart';
import 'package:descend/viewmodel/UserViewModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class BoardDetail extends StatefulWidget {
  BoardDetail({
    Key? key,
  }) : super(key: key);
  static const routename = '/BoardDetail';

  @override
  State<BoardDetail> createState() => _BoardDetail();
}

class _BoardDetail extends State<BoardDetail> {
  var feedViewModel = Get.put(FeedViewModel());
  var userViewModel = Get.put(UserViewModel());

  @override
  Widget build(BuildContext context) {
    /// TODO Backend 완성 후 수정
    // Variables
    List<String> files = ["file1.png", "file2.pdf", "files3.mp3", "files4.sh"];
    int btnTxtColor = 0xffff0000;
    double valPadding = 32.0;

    return Scaffold(
        body: FutureBuilder(
            future: feedViewModel.getComment(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return CircularProgressIndicator();
              else
                return SafeArea(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: valPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                GoBack(),
                                TextButton(
                                  onPressed: ()async{
                                    await feedViewModel.deleteBoard();
                                    Get.off(SubjectDetailScreen());
                                  },
                                  child : Text(userViewModel.currentUser.id ==
                                          feedViewModel.currentFeed?.userId
                                      ? "삭제하기"
                                      : "",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 22,
                                    color: Color(btnTxtColor),
                                  ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: (){
                                    print(feedViewModel.currentFeed?.id);
                                    Get.to(UpdateBoard());
                                  },
                                  child : Text(userViewModel.currentUser.id ==
                                      feedViewModel.currentFeed?.userId
                                      ? "수정하기"
                                      : "",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 22,
                                      color: Color(btnTxtColor),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),


                      Expanded(
                        flex: 10,
                        child: ListView(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: valPadding),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "${feedViewModel.currentFeed?.title}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 30),
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
                                    "${feedViewModel.currentFeed?.createdAt?.substring(0,10)}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 24,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    "${feedViewModel.currentFeed?.content}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 20,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 40),
                                  const Divider(
                                      height: 2,
                                      color: Color.fromRGBO(219, 219, 219, 1),
                                      thickness: 1),
                                  const SizedBox(height: 40),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: feedViewModel.currentCommentList.length,
                                  itemBuilder: (context, idx) {
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 10,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '익명',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                "${feedViewModel.currentCommentList[idx].content}",
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),
                                              SizedBox(height: 15),
                                            ],
                                          ),
                                        ),
                                        Expanded(child: Text(""), flex: 1,),
                                        Expanded(
                                          flex: 3,
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              "${feedViewModel.currentCommentList[idx].createdAt?.substring(0,10)}",
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: MediaQuery.of(context).size.width * 0.15,
                            width: MediaQuery.of(context).size.width * 0.85,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 8, 20, 3),
                              child: TextField(
                                controller: feedViewModel.comment,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "댓글 작성",
                                    focusColor: Colors.black,
                                    suffixIcon: GestureDetector(
                                        onTap: () async {
                                          print(feedViewModel.currentFeed?.title);
                                          await feedViewModel.createComment();
                                          setState(() {});
                                        },
                                        child: Icon(Icons.search)),
                                    filled: false),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
            }));
  }
}
