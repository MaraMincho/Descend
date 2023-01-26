import 'package:descend/model/Subject.dart';
import 'package:descend/view/SubjectDetailScreen.dart';
import 'package:descend/viewmodel/FeedViewModel.dart';
import 'package:descend/viewmodel/SubViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MiniSubInfo extends StatelessWidget {
  var subViewModel = Get.put(SubViewModel());
  final Subject subject;
  MiniSubInfo({Key? key,
    required this.subject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var feedViewModel = Get.put(FeedViewModel());
    return InkWell(
      onTap: (){
        feedViewModel.currentSubject = subject;
        Get.to(SubjectDetailScreen());
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
                  FittedBox(fit: BoxFit.scaleDown, child: Text('${subject.subname}', style: TextStyle(fontSize: 28, letterSpacing: -1),)),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(""),
                    // Text("") : Text("$time",
                    //   style: TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.6), letterSpacing: -1.3),),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 3,
                child: SizedBox()),
            Expanded(
                flex: 5,
                child: FittedBox(fit: BoxFit.scaleDown,child: Text("${subject.professor} 교수"))),
          ],
        ),
      ),
    );
  }
}
