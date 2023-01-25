
import 'package:descend/view/Login/login.dart';
import 'package:descend/view/MainScreen.dart';
import 'package:descend/viewmodel/SignUpViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'MakeInput.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var signUpViewModel = Get.put(SignupViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading:
        IconButton( onPressed: (){
          Navigator.pop(context);
        },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text ("Sign up", style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(height: 20,),
                      Text("Create an Account,Its free",style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                      ),),
                      SizedBox(height: 30,)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 40
                    ),
                    child: Column(
                      children: [
                        MakeInput(label: "Name", textEdit: signUpViewModel.userName),
                        MakeInput(label: "Email", textEdit: signUpViewModel.userID),
                        MakeInput(label: "Password",obsureText: true, textEdit: signUpViewModel.userPW),
                        MakeInput(label: "Confirm Pasword",obsureText: true, textEdit: signUpViewModel.checkPW)
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      padding: EdgeInsets.only(top: 3,left: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border(
                              bottom: BorderSide(color: Colors.black),
                              top: BorderSide(color: Colors.black),
                              right: BorderSide(color: Colors.black),
                              left: BorderSide(color: Colors.black)
                          )
                      ),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height:60,
                        onPressed: (){
                          signUpViewModel.check();
                          if(signUpViewModel.userName.text == "") {
                            Get.snackbar('알림', '아이디를 입력하세요', duration: Duration(seconds: 1), snackPosition: SnackPosition.BOTTOM);
                          }
                          else if (signUpViewModel.userID.text == "")
                            Get.snackbar('알림', '이메일을 입력하세요', duration: Duration(seconds: 1), snackPosition: SnackPosition.BOTTOM);

                          else if(signUpViewModel.isSamePW == false) {
                            signUpViewModel.check();
                            Get.snackbar('알림', '두 비밀번호가 다릅니다.', duration: Duration(seconds: 1), snackPosition: SnackPosition.BOTTOM);
                          }
                          else {
                            signUpViewModel.check();
                            return completeDialog(context);
                          }
                        },
                        color: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)
                        ),
                        child: Text("Sign Up",style: TextStyle(
                          fontWeight: FontWeight.w600,fontSize: 16,

                        ),),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account? "),
                      InkWell(

                        onTap: (){Get.offAll(LoginPage());},
                        child: Text("Login",style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                        ),),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void completeDialog(BuildContext context) {
  showDialog(
      context: context,
      //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)),
          //Dialog Main Title
          title: Column(
            children: <Widget>[
              new Text("알림"),
            ],
          ),
          //
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "회원가입이 정상적을 완료되었습니다.",
              ),
            ],
          ),
          actions: <Widget>[
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                child: new Text("확인"),
                onPressed: () {
                  Get.offAll(LoginPage());
                },
              ),
            ),
          ],
        );
      });
}
