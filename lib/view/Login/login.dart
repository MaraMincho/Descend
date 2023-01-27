import 'package:descend/view/HomeScreen.dart';
import 'package:descend/view/Login/SignUp.dart';
import 'package:descend/view/Login/test.dart';
import 'package:descend/view/MainScreen.dart';
import 'package:descend/view/test2.dart';
import 'package:descend/viewmodel/LoginViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'MakeInput.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var userViewModel = Get.put(LoginViewModel());
  var loginViewModel = Get.put(LoginViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Column(
                  children: [
                    Container(width: double.infinity, height: 250,
                        alignment: Alignment.center,
                        child: Lottie.asset('images/imgs/loginimg.json', fit: BoxFit.fitHeight)),
                    Text ("로그인 하세요!", style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: 20,),
                    Text("디센드에 온 것을 환영합니다!",style: TextStyle(
                      fontSize: 20,
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
                      MakeInput(label: "Email", textEdit: userViewModel.userID),
                      MakeInput(label: "Password", textEdit: userViewModel.userPW, obsureText: true),
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
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return FutureBuilder(
                                  future: loginViewModel.login(),
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData) {
                                      return Center(child: CircularProgressIndicator());
                                    }
                                    else if (snapshot.hasError) {
                                      return Text('${snapshot.error}');
                                    }
                                    else {
                                      return LoginMessage(statuscode: int.parse(snapshot.data.toString()));
                                    }
                                  }
                              );
                            }
                        );
                        },
                      color: Colors.indigoAccent[400],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)
                      ),
                      child: Text("Losgin",style: TextStyle(
                          fontWeight: FontWeight.w600,fontSize: 16,color: Colors.white70
                      ),),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("계정이 없으신가요?"),
                    InkWell(
                      onTap: (){
                        Get.to(SignupPage());
                        },
                      child: Text("  Sign Up",style: TextStyle(
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
      ).animate()
          .fadeIn(delay: 300.ms, duration: 500.ms),
    );
  }
}


class LoginMessage extends StatelessWidget {
  LoginMessage({Key? key, required this.statuscode}) : super(key: key);
  final int statuscode;

  @override
  Widget build(BuildContext context) {
    if (statuscode == 201) {
      return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 2)).then((onValue) => true),
          builder: (context, snapshot) {
          if(!snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(50.0),
              child: Lottie.asset('images/imgs/success.json'),
            );
          }
          else {
            return DummyPage();
          }
        });
    }
    else
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
              '아이디 혹은 비밀번호가 잘못되었습니다.'
            ),
          ],
        ),
        actions: <Widget>[
          Container(
            alignment: Alignment.center,
            child: ElevatedButton(
              child: new Text(
                '확인'
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ],
      );
  }
}

