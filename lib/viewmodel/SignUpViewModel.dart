import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupViewModel extends GetxController {
  TextEditingController userID = new TextEditingController();
  TextEditingController userName = new TextEditingController();
  TextEditingController userPW = new TextEditingController();
  TextEditingController checkPW = new TextEditingController();
  bool isSamePW = false;
  void check() {
    if (userPW.text == checkPW.text)
      isSamePW = true;
    else
      isSamePW = false;
  }

}