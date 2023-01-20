import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Test2 extends StatefulWidget {
  const Test2({Key? key}) : super(key: key);

  @override
  State<Test2> createState() => _Test2State();
}

class _Test2State extends State<Test2> {

  String? token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('피드'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          FeedWidget(),
          ElevatedButton(onPressed: () async{
            print('실행');
            var url = Uri.http('192.168.41.71:3000', 'api/user/register');
            var response = await http.post(
                url,
                body: {'name': '고양이 귀여워', 'password': 'blue', "email" : "cat@isthemostcute.animal"}
            );
            print('Response status: ${response.statusCode}');
            print('Response body: ${response.body}');
            token = response.body;

            // Obtain shared preferences.
            final prefs = await SharedPreferences.getInstance();

// Save an integer value to 'counter' key.
            await prefs.setString('token', '${token}');

            final String? shardToken = prefs.getString('token');
            print('토큰은?');
            print(shardToken);


          }, child: Text('123')),
        ],
      ),
    );
  }
}

class FeedWidget extends StatelessWidget {
  const FeedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.red,
                child: ClipOval(
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(27), // Image radius
                    child: Image.asset('images/imgs/img.png', fit: BoxFit.fill,)
                  ),
                ),
              ),
              SizedBox(width: 15,),
              Text('홍길동', style: TextStyle(fontSize: 25, letterSpacing: -1),),
            ],
          ),
          SizedBox(height: 10,),
          Text('운명이 우리에게 배푸는 약간의 불행을 지금까지 한없기 곱씹었는데 이제는 그러지 않으려네. 현재의 것을 즐기고, 지난 일은 지난 일로 묻어 두려네. 이보게 사람들은 무심한 현재를 참아내기 보다는 차라리 열심히 상상력을 발휘하여 지나간 불운의 기억을 되살린다는 자네 말이 백번 맞네'),
          SizedBox(height: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('2022-01-01'),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(onPressed: (){
                  }, child: Text('수정')),
                  SizedBox(width: 10,),
                  ElevatedButton(onPressed: (){
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoDialogAction(child: Text('123'));
                        return AlertDialog(
                          title: Text("피드 삭제"),
                          content: Text('정말 삭제하시겠습니까'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                    }, child: Text('삭제')),
                ],
              )
            ],
          ),


        ],
      ),
    );
  }
}

