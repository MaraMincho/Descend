import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubjectDetailScreen extends StatefulWidget {
  const SubjectDetailScreen({Key? key}) : super(key: key);

  @override
  State<SubjectDetailScreen> createState() => _SubjectDetailScreenState();
}

class _SubjectDetailScreenState extends State<SubjectDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
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
            ),

            Text("강의명 : 현장프로젝트 교과", style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700, letterSpacing: -1),),
            SizedBox(height: 10,),
            Text("교수명 : 정의훈 교수님", style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700, letterSpacing: -1),),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: (){},
                  child: Text("글쓰기", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),))
              ),
            ),

            Expanded(
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Column(
                      children: [
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
                        SizedBox(height: 30,),
                        LectureEvaluation(),
                        LectureEvaluation(),
                        LectureEvaluation(),
                        LectureEvaluation(),
                        SizedBox(height: 20,),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.black.withOpacity(0),
                                foregroundColor: Colors.black.withOpacity(0.7),
                                backgroundColor: Colors.black.withOpacity(0.2),
                              ),
                              child: Text('강의평 더보기')
                          ),
                        ),
                        SizedBox(height: 30,),
                        PreviewBoard(),
                        PreviewBoard(),
                        PreviewBoard(),
                        PreviewBoard(),

                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.black.withOpacity(0),
                                foregroundColor: Colors.black.withOpacity(0.7),
                                backgroundColor: Colors.black.withOpacity(0.2),
                              ),
                              child: Text('자료 더보기')
                          ),
                        ),


                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
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
  const PreviewBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('현장프로젝트 정리 노트입니다.', style: TextStyle(fontSize: 17),),
          Row(
            children: [
              Expanded(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text('운명이 우리에게 배푸는 약간의 불행을 지..')

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
