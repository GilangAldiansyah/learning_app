import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/values/colors.dart';
import 'package:learning_app/pages/course/course_page.dart';
import 'package:learning_app/pages/home/home_page.dart';
import 'package:learning_app/pages/profile/profile.dart';

Widget buildPage(int index) {
  List<Widget> _widget = [
    const HomePage(),
    const CoursePage(),
    // Center(child: Text("Course")),
    // Center(child: Text("Chat")),
    const ProfilePage(),
  ];

  return _widget[index];
}

var buttomTabs = [
  BottomNavigationBarItem(
      label: "home",
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/home.png"),
      ),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          "assets/icons/home.png",
          color: AppColors.primaryElement,
        ),
      )),
  // BottomNavigationBarItem(
  //     label: "search",
  //     icon: SizedBox(
  //       width: 15.w,
  //       height: 15.h,
  //       child: Image.asset("assets/icons/search2.png"),
  //     ),
  //     activeIcon: SizedBox(
  //       width: 15.w,
  //       height: 15.h,
  //       child: Image.asset(
  //         "assets/icons/search2.png",
  //         color: AppColors.primaryElement,
  //       ),
  //     )),
  BottomNavigationBarItem(
      label: "course",
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/play-circle1.png"),
      ),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          "assets/icons/play-circle1.png",
          color: AppColors.primaryElement,
        ),
      )),
  // BottomNavigationBarItem(
  //     label: "chat",
  //     icon: SizedBox(
  //       width: 15.w,
  //       height: 15.h,
  //       child: Image.asset("assets/icons/message-circle.png"),
  //     ),
  //     activeIcon: SizedBox(
  //       width: 15.w,
  //       height: 15.h,
  //       child: Image.asset(
  //         "assets/icons/message-circle.png",
  //         color: AppColors.primaryElement,
  //       ),
  //     )),
  BottomNavigationBarItem(
      label: "profile",
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/person2.png"),
      ),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          "assets/icons/person2.png",
          color: AppColors.primaryElement,
        ),
      )),
];
