import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/apis/course_api.dart';
import 'package:learning_app/common/entities/entities.dart';
import 'package:learning_app/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:learning_app/pages/home/bloc/home_page_blocs.dart';
import 'package:learning_app/pages/home/bloc/home_page_event.dart';

class HomeController {
  late BuildContext context;
  UserItem get userProfile => Global.storageService.getUserProfile();
  
  static final HomeController _singleton = HomeController._external();

  HomeController._external();
  
  factory HomeController({required BuildContext context}){
    _singleton.context = context;

    return _singleton;
  }

  // Future<void> init() async{
  //   if(Global.storageService.getUserToken().isNotEmpty){

  //   }
  // }

  Future<void> init() async {
    // print('...home controller init method');

    // memastikan user terautentikasi/tidak dgn melakukan cek token
    if (Global.storageService.getUserToken().isNotEmpty) {
      var result = await CourseApi.courseList();
      print('the result is ${(result.data![0].thumbnail!)}');
      if (result.code == 200) {
        if (context.mounted) {
          context.read<HomePageBlocs>().add(HomePageCourseItem(result.data!));
        }
        // print(result.data![1].description);
      } else {
        // print(result.code);
      }
    } else {
      print('user telah logout');
    }
  }
}
