import 'dart:convert';

import 'package:descend/model/User.dart';
import 'package:descend/viewmodel/UserRepo.dart';
import 'package:descend/viewmodel/UserViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  var userRepo = Get.put(UserRepository());
  var userViewModel = Get.put(UserViewModel());
  TextEditingController userID = new TextEditingController();
  TextEditingController userPW = new TextEditingController();


  Future login() async {
    var response = await userRepo.login(userID.text, userPW.text);
    var jsonString = jsonDecode(jsonEncode(response.body));
    print(jsonString);
    if (response.statusCode == 201) {
      userViewModel.user = User.fromJson(jsonString);
    }

    var temp = response.statusCode.toString();
    return temp;
  }


}
