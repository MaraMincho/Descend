
import 'package:descend/model/FeedModel.dart';
import 'package:descend/model/Subject.dart';
import 'package:descend/viewmodel/FeedRepo.dart';
import 'package:descend/viewmodel/SubViewModel.dart';
import 'package:descend/viewmodel/UserViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/Comment.dart';

class FeedViewModel extends GetxController{

  var feedRepo = Get.put(FeedRepo());
  var currentUser = Get.put(UserViewModel());




  var title = TextEditingController();
  var content = TextEditingController();
  var comment = TextEditingController();

  Feed? currentFeed;
  Subject? currentSubject;

  List<Feed> currentFeedList = [];
  List<Comment> currentCommentList = [];
  Future createBoard() async {
    var respons = await feedRepo.createBoard(title.text, content.text, currentSubject?.id, currentUser.currentUser.id);
  }
  Future deleteBoard() async{
    print("들리트");
    var response = await feedRepo.deleteBoard(currentFeed?.id);
  }
  Future updateBoard() async{
    update();
    print("업데이트");
    print(content.text);
    print(title.text);
    await feedRepo.updateBoard(currentFeed?.id, title.text, content.text);
  }

  Future createComment() async {
    var response = await feedRepo.createComment(currentUser.currentUser.id, currentFeed?.id, comment.text);
  }


  Future getComment() async {
    currentCommentList = [];
    var response = await feedRepo.getCommnet(currentFeed?.id);
    var temp = response.body as List;
    print("커멘트는?");
    print(temp);
    for (Map<String, dynamic> i in temp)  {
      var element = Comment.fromJson(i);
      currentCommentList.add(element);
    }
    return response.body;
  }


  Future getBoard() async {
    currentFeedList = [];
    var response = await feedRepo.getBoard(5);
    var temp = response.body as List;
    print("개수느?");
    print(temp.length);
    for (Map<String, dynamic> i in temp)  {
      var element = Feed.fromJson(i);
      currentFeedList.add(element);
    }
    return response.body;
  }

}