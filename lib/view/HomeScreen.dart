import 'package:descend/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            floating: false,
            pinned: true,
            snap: false,
            shadowColor: Colors.white.withOpacity(0),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(150),
              child: GestureDetector(
                  onTap: (){
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                    child: ProfileViewer(),
                  )),
            ),
          ),
          SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
              child: Text('겨울 학기', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Column(
                children: [
                  CurrentStudy(),
                  CurrentStudy(),
                  CurrentStudy(),
                  CurrentStudy(),
                ],
              ),
            ).animate()
                .fadeIn(delay: 300.ms, duration: 500.ms),
          ])
          ),
        ],
      )
    );
  }
}

class CurrentStudy extends StatelessWidget {
  const CurrentStudy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
      alignment: AlignmentDirectional.topStart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('현장 프로젝트 교과', style: TextStyle(fontSize: 28, letterSpacing: -1),),
          Text('월 [1~5] 09:30~14:20 화 [1~5] 09:30~14:20 수 [1~5] 09:30~14:20 목 [1~5] 09:30~14:20 금 [1~5] 09:30~14:20 (E동513호)',
            style: TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.6), letterSpacing: -1.3),
          )
        ],
      ),
    );
  }
}
