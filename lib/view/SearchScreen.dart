import 'package:descend/view/HomeScreen.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.15,
                    width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 8, 20, 3),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(

                            border: InputBorder.none,
                            hintText: "과목명 교수명으로 검색",
                            focusColor: Colors.black,

                            suffixIcon: Icon(Icons.search),
                            filled: false
                          ),
                        ),
                      ),
                  ),
                ),

                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 20, 5, 10),
                        child: Text("현재 듣는 강의", style: TextStyle(fontSize: 19, letterSpacing: -1),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            CurrentStudy(),
                            CurrentStudy(),
                            CurrentStudy(),
                            CurrentStudy(),
                            CurrentStudy(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      )
    );
  }
}
