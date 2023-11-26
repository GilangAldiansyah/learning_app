import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/pages/course/widgets/course_detail_widgets.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({Key? key}) : super(key: key);

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  late var id;
  @override
  // void initState(){
  //   // super.initState(){
  //   //   // var data = ModalRoute.of(context)!.settings.arguments as map;
  //   //   // print(data.values)
  //   }
  // }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(), body: const Center(child: Text("Course")));
  }
}
