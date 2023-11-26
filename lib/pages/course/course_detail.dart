import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/values/colors.dart';
import 'package:learning_app/common/widgets/base_text_widget.dart';
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
                      thumbNail(),
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
                          "Laravel adalah framework permrograman mobile",
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
