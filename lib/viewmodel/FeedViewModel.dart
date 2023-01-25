import 'dart:convert';

import 'package:descend/model/FeedModel.dart';
import 'package:descend/viewmodel/FeedRepo.dart';
import 'package:get/get.dart';

class FeedController extends GetxController {
  final feedRepo = Get.put(FeedRepo sitory());
  List feedList = [];


  Future<bool?> feedindex() async {
    var body = await feedRepo.feedIndex();
    if (body == null) {
      return false;
    }
    body = body.toList();
    List feed = body.map((e) => FeedModel.fromJson(e)).toList(); //feed를 간편하게 List로 변환 복잡하게 for문 쓸 필요 없음.
    feedList = feed;
    update();
    return true;
  }
}