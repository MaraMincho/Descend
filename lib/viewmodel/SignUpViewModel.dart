import 'package:descend/viewmodel/UserViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'UserRepo.dart';

class SignupViewModel extends GetxController {
  TextEditingController userID = new TextEditingController();
  TextEditingController userName = new TextEditingController();
  TextEditingController userPW = new TextEditingController();
  TextEditingController checkPW = new TextEditingController();
  final userRepo = Get.put(UserRepository());

  var userViewModel = Get.put(UserViewModel());
  bool isSamePW = false;
  void check() {
    if (userPW.text == checkPW.text)
      isSamePW = true;
    else
      isSamePW = false;
  }
  Future<int?> register() async{
    return await userRepo.register(userName.text, userID.text, userPW.text);
  }
}