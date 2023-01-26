import 'package:descend/view/HomeScreen.dart';
import 'package:descend/view/widget/MiniSubinfo.dart';
import 'package:descend/viewmodel/SubViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchViewModel = Get.put(SubViewModel());
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
                          controller: searchViewModel.searchStr,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(

                            border: InputBorder.none,
                            hintText: "과목명 교수명으로 검색",
                            focusColor: Colors.black,

                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  searchViewModel.searchSub();
                                });
                              },
                                child: Icon(Icons.search)),
                            filled: false
                          ),
                        ),
                      ),
                  ),
                ),

                Expanded(
                  child: GetBuilder<SubViewModel>(
                    builder: (_) {
                      return ListView.builder(
                        itemCount: _.subList.length,
                        itemBuilder: (context, int index){
                          return MiniSubInfo(name: _.subList[index].subname, time: _.subList[index].time, professor: _.subList[index].professor,);
                        }
                      );
                    }
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
