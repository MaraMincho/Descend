import 'dart:convert';

import 'package:descend/model/Subject.dart';
import 'package:descend/viewmodel/SubjectRepo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SubViewModel extends GetxController{
  TextEditingController searchStr = TextEditingController();
  var subRepo  = Get.put(SubRepository());
  List<Subject> subList = [];
  Future searchSub() async {
    subList = [];
    var temp = await subRepo.searchSub(searchStr.text);
    for (Map<String, dynamic> i in temp.body)  {
      var element = Subject.fromJson(i);
      subList.add(element);
    }
    update();
  }
}