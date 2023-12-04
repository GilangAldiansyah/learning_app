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
  late List<String> videoURLs;
  late List<String> videoTitles;
  late List<YoutubePlayerController> controllers;


  @override
  void initState() {
    super.initState();
    videoURLs = [
      "https://www.youtube.com/watch?v=8t_0Nfd_Ne4&t=417s",
      "https://www.youtube.com/watch?v=CzRQ9mnmh44&pp=ygUOZmx1dHRlciBjb3Vyc2U%3D",
      "https://www.youtube.com/watch?v=CzRQ9mnmh44&pp=ygUOZmx1dHRlciBjb3Vyc2U%3D",
    ];

    videoTitles = [
      "Belajar Flutter",
      "Belajar Pemrograman Web",
      "Belajar Pemrograman Mobile",
    ];

    controllers = videoURLs.map((url) {
      final videoID = YoutubePlayer.convertUrlToId(url);
      return YoutubePlayerController(
        initialVideoId: videoID!,
        flags: const YoutubePlayerFlags(autoPlay: false),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: controllers.asMap().entries.map((entry) {
            final index = entry.key;
            final controller = entry.value;
            final title = videoTitles[index];

            return Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  YoutubePlayer(
                    controller: controller,
                    showVideoProgressIndicator: true,
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
