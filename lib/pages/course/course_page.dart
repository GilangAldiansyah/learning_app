import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/values/colors.dart';
import 'package:learning_app/common/widgets/base_text_widget.dart';
import 'package:learning_app/pages/course/widgets/course_page_widgets.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  late var id;
  @override
  // void initState(){
  //   // super.initState(){
  //   //   // var data = ModalRoute.of(context)!.settings.arguments as map;
  //   //   // print(data.values)
  //   }
  // }
  final videoURL = "https://www.youtube.com/watch?v=8t_0Nfd_Ne4&t=417s";

  late YoutubePlayerController _controller;

  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);

    _controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: const YoutubePlayerFlags(autoPlay: false));

    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,
                      ),
                      // thumbNail(),
                      SizedBox(
                        height: 15.h,
                      ),
                      menuView(),
                      SizedBox(
                        height: 15.h,
                      ),
                      reusableText("Course Description"),
                      SizedBox(
                        height: 15.h,
                      ),
                      reusableText(
                          "Laravel adalah framework permrograman mobile bos",
                          color: AppColors.primaryThreeElementText,
                          fontWeight: FontWeight.normal,
                          fontSize: 11.sp)
                    ]),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
