import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/values/colors.dart';
import '../../../common/widgets/base_text_widget.dart';

AppBar buildAppBar() {
  return AppBar(
    title: reusableText("Course Detail"),
  );
}

Widget thumbNail() {
  return Container(
    width: 325.w,
    height: 200.h,
    decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage("assets/icons/image(3).png"))),
  );
}

Widget menuView() {
  return Container(
    width: 325.w,
    child: Row(children: [
      GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
          decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(7.w),
              border: Border.all(color: AppColors.primaryElement)),
          child: reusableText("Author Page",
              color: AppColors.primaryElementText,
              fontWeight: FontWeight.normal,
              fontSize: 10.sp),
        ),
      ),
      _iconAndNum("assets/icons/people.png", 0),
      _iconAndNum("assets/icons/star.png", 0),
    ]),
  );
}

Widget _iconAndNum(String iconPath, int num) {
  return Container(
    margin: EdgeInsets.only(left: 30.w),
    child: Row(children: [
      Image(
        image: AssetImage(iconPath),
        width: 20.w,
        height: 20.h,
      ),
      reusableText(num.toString(),
          color: AppColors.primaryThreeElementText,
          fontSize: 11.sp,
          fontWeight: FontWeight.normal)
    ]),
  );
}
