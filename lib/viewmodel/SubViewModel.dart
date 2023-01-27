import 'dart:convert';

import 'package:descend/model/Subject.dart';
import 'package:descend/viewmodel/SubjectRepo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SubViewModel extends GetxController{
  TextEditingController searchStr = TextEditingController();
  var subRepo  = Get.put(SubRepository());
  var id;
  List<Subject> searchSubjectList = [];
  Future searchSub() async {
    searchSubjectList = [];
    var temp = await subRepo.searchSub(searchStr.text);
    for (Map<String, dynamic> i in temp.body)  {
      var element = Subject.fromJson(i);
      searchSubjectList.add(element);
    }
    update();
  }
}