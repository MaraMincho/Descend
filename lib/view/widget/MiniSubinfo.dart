import 'package:descend/view/SubjectDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MiniSubInfo extends StatelessWidget {
  String? name = "현장 프로젝트 교과";
  String? time = "월 [1~5] 09:30~14:20 화 [1~5] 09:30~14:20 수 [1~5] 09:30~14:20 목 [1~5] 09:30~14:20 금 [1~5] 09:30~14:20 (E동513호)";
  String? professor = "정의훈";
  MiniSubInfo({Key? key, this.name, this.time, this.professor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(SubjectDetailScreen(subName: name, subProfessor: professor,));
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
        alignment: AlignmentDirectional.topStart,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            Expanded(
              flex: 15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FittedBox(fit: BoxFit.scaleDown, child: Text('$name', style: TextStyle(fontSize: 28, letterSpacing: -1),)),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: time == null? Text("") : Text("time",
                      style: TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.6), letterSpacing: -1.3),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 3,
                child: SizedBox()),
            Expanded(
                flex: 5,
                child: FittedBox(fit: BoxFit.scaleDown,child: Text("$professor 교수"))),
          ],
        ),
      ),
    );
  }
}
