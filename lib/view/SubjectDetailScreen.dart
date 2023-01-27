import 'package:descend/model/FeedModel.dart';
import 'package:descend/view/BoardDetail.dart';
import 'package:descend/view/CreateBoardScreen.dart';
import 'package:descend/view/HomeScreen.dart';
import 'package:descend/view/widget/GoBack.dart';
import 'package:descend/viewmodel/FeedViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubjectDetailScreen extends StatefulWidget {

  SubjectDetailScreen({Key? key}) : super(key: key);

  @override
  State<SubjectDetailScreen> createState() => _SubjectDetailScreenState();
}

class _SubjectDetailScreenState extends State<SubjectDetailScreen> {

  var feedViewModel = Get.put(FeedViewModel());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: feedViewModel.getBoard(), //수정요망
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return CircularProgressIndicator();
        else
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){Get.offAll(HomeScreen());},
                      child: GoBack()),
                  Text("강의명 : ${feedViewModel.currentSubject?.subname}", style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700, letterSpacing: -1),),
                  SizedBox(height: 10,),
                  Text("교수명 : ${feedViewModel.currentSubject?.professor}", style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700, letterSpacing: -1),),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: (){},
                        child: InkWell(
                          onTap: () {
                            Get.off(CreateBoardScreen());
                            },
                            child: Text("글쓰기", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
                            )))
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('4.83',
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -1.5
                        ),
                      ),
                      SizedBox(width: 10,),
                      StarPoint(starSize: 35),
                    ],
                  ),
                  Expanded(
                      child: GetBuilder<FeedViewModel>(
                        builder: (_) {
                          return ListView.builder(
                            itemCount: _.currentFeedList.length,
                              itemBuilder: (context, ind) {
                                return InkWell(
                                  onTap: (){
                                    _.currentFeed = _.currentFeedList[ind];
                                    Get.to(BoardDetail());
                                    },
                                    child: PreviewBoard(
                                      currentFeed:_.currentFeedList[ind],
                                      title: _.currentFeedList[ind].title,
                                      content: _.currentFeedList[ind].content,
                                    )
                                );
                              }
                          );
                        }
                      )
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}

class LectureEvaluation extends StatelessWidget {
  const LectureEvaluation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              StarPoint(starSize: 20),
              SizedBox(width: 10,),
              Stack(
                alignment: Alignment.center,
                children: [
                Icon(Icons.thumb_up, size: 13, color: Colors.red,),
              ],),
              SizedBox(width: 5,),
              Text('1', style: TextStyle(color: Colors.red, fontSize: 15, fontWeight: FontWeight.w700),)
            ],
          ),
          SizedBox(height: 10,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('익명', style: TextStyle(fontSize: 20, color: Colors.black.withOpacity(0.8))),
              Text('(자신이 작성한 개시물 입니다.)', style: TextStyle(fontSize: 15)),
            ],
          ),
          Text('생각보다 도움이 많이되었습니다!',style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.6))),
        ],
      ),
    );
  }
}



class StarPoint extends StatelessWidget {
  final double starSize;
  const StarPoint({
    Key? key,
    required this.starSize
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxShadow starShadow = BoxShadow(
        color: Colors.black.withOpacity(0.1),
        offset: Offset(-0.8, 0.8),
        blurRadius: 0.3,
        spreadRadius: 2
    );
    return Row(
      children: [
        Icon(Icons.star, color: Colors.yellow, size: starSize,shadows: [starShadow],),
        Icon(Icons.star, color: Colors.yellow, size: starSize,shadows: [starShadow],),
        Icon(Icons.star, color: Colors.yellow, size: starSize,shadows: [starShadow],),
        Icon(Icons.star, color: Colors.yellow, size: starSize,shadows: [starShadow],),
        Icon(Icons.star, color: Colors.yellow, size: starSize,shadows: [starShadow],),
      ],
    );
  }
}


class PreviewBoard extends StatelessWidget {
  String? title;
  String? content;
  Feed? currentFeed;
  PreviewBoard({Key? key,
    required this.title, required this.content,
    required this.currentFeed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$title', style: TextStyle(fontSize: 17),),
          Row(
            children: [
              Expanded(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text('${content}')

                  ],
                ),
              ),
              Expanded(flex: 2, child: SizedBox()),
              Expanded(
                  flex: 2,
                  child: Text('익명')
              )
            ],
          ),
        ],
      ),
    );
  }
}
