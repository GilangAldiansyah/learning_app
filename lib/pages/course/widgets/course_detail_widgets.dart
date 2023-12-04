import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/values/colors.dart';
import 'package:learning_app/common/values/constant.dart';
import 'package:learning_app/pages/course/course_detail/bloc/course_detail_states.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../common/widgets/base_text_widget.dart';

AppBar buildAppBar() {
  return AppBar(
    title: reusableText("Course Detail"),
  );
}

Widget thumbNail(String thumbnail) {
  return Container(
    width: 325.w,
    height: 200.h,
    decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: NetworkImage("${AppConstants.SERVER_UPLOADS}$thumbnail"))),
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

Widget descriptionText(String description) {
  return reusableText(description,
      color: AppColors.primaryThreeElementText,
      fontWeight: FontWeight.normal,
      fontSize: 15.sp);
}

// Widget video(
//     String video, List<YoutubePlayerController> controller, String videoTitle) {
//   return Scaffold(
//     appBar: buildAppBar(),
//     body: SingleChildScrollView(
//       child: Column(
//         children: controller.asMap().entries.map((entry) {
//           final index = entry.key;
//           final controller = entry.value;
//           final title = videoTitle;

//           return Padding(
//             padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 YoutubePlayer(
//                   controller: controller,
//                   showVideoProgressIndicator: true,
//                 ),
//                 SizedBox(height: 5.0),
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18.0,
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }).toList(),
//       ),
//     ),
//   );
// }
