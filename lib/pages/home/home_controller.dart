import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/apis/course_api.dart';
import 'package:learning_app/common/entities/entities.dart';
import 'package:learning_app/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:learning_app/pages/home/bloc/home_page_blocs.dart';
import 'package:learning_app/pages/home/bloc/home_page_event.dart';

class HomeController {
  final BuildContext context;
  HomeController({required this.context});

  UserItem? userProfile = Global.storageService.getUserProfile();

  // Future<void> init() async{
  //   if(Global.storageService.getUserToken().isNotEmpty){

  //   }
  // }

  Future<void> init() async {
    // print('...home controller init method');
    var result = await CourseApi.courseList();
    if (result.code == 200) {
      context.read<HomePageBlocs>().add(HomePageCourseItem(result.data!));
      // print(result.data![1].description);
    } else {
      print(result.code);
    }
  }
}
