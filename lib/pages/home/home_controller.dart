import 'package:flutter/material.dart';
import 'package:learning_app/common/entities/entities.dart';
import 'package:learning_app/global.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  final BuildContext context;
  HomeController({required this.context});

  UserItem? userProfile = Global.storageService.getUserProfile();

  // Future<void> init() async{
  //   if(Global.storageService.getUserToken().isNotEmpty){

  //   }
  // }

  void init() {
    print('...home controller init method');
  }
}
