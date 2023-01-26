import 'package:descend/view/Login/login.dart';
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
                      Text ("회원가입", style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(height: 20,),
                      Text("무료로 즐기세요!",style: TextStyle(
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
                        MakeInput(label: "이름", textEdit: signUpViewModel.userName),
                        MakeInput(label: "이메일", textEdit: signUpViewModel.userID),
                        MakeInput(label: "비밀번호",obsureText: true, textEdit: signUpViewModel.userPW),
                        MakeInput(label: "비밀번호 확인",obsureText: true, textEdit: signUpViewModel.checkPW)
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
                        onPressed: () async {
                          signUpViewModel.check();
                          if(signUpViewModel.userName.text == "") {
                            Get.snackbar('알림', '아이디를 입력하세요', duration: Duration(seconds: 1), snackPosition: SnackPosition.BOTTOM);
                          }
                          else if (signUpViewModel.userID.text == "")
                            Get.snackbar('알림', '이메일을 입력하세요', duration: Duration(seconds: 1), snackPosition: SnackPosition.BOTTOM);
                          else if (signUpViewModel.userPW.text == "")
                            Get.snackbar('알림', '비밀번호를 입력하세요', duration: Duration(seconds: 1), snackPosition: SnackPosition.BOTTOM);
                          else if(signUpViewModel.isSamePW == false) {
                            signUpViewModel.check();
                            Get.snackbar('알림', '두 비밀번호가 다릅니다.', duration: Duration(seconds: 1), snackPosition: SnackPosition.BOTTOM);
                          }
                          //문제 없을 때
                          else {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) {
                                return FutureBuilder(
                                    future: signUpViewModel.register(),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return Center(child: CircularProgressIndicator());
                                      }
                                      else if (snapshot.hasError) {
                                        return Text('${snapshot.error}');
                                      }
                                      else {
                                        return SignUpMessage(statuscode: snapshot.data as int,);
                                      }
                                    }
                                );
                              }
                            );
                          }
                        },
                        color: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)
                        ),
                        child: Text("회원가입 완료",style: TextStyle(
                          fontWeight: FontWeight.w600,fontSize: 16,

                        ),),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("이미 계정이 있으신가요? "),
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


class SignUpMessage extends StatelessWidget {
  SignUpMessage({Key? key, required this.statuscode}) : super(key: key);
  final int statuscode;
  @override
  Widget build(BuildContext context) {
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
            statuscode == 201 ? "회원가입이 정상적을 완료되었습니다." : "중복된 이메일입니다.",
          ),
        ],
      ),
      actions: <Widget>[
        Container(
          alignment: Alignment.center,
          child: ElevatedButton(
            child: new Text(
                statuscode == 201? "확인": "뒤로가기"
            ),
            onPressed: () {
              statuscode == 201?
              Get.offAll(LoginPage()) :
              Get.back();
            },
          ),
        ),
      ],
    );
  }
}

