import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/values/colors.dart';
import 'package:learning_app/common/widgets/base_text_widget.dart';
import 'package:learning_app/pages/course/course_detail/bloc/course_detail_blocs.dart';
import 'package:learning_app/pages/course/course_detail/bloc/course_detail_states.dart';
import 'package:learning_app/pages/course/course_detail/course_detail_controller.dart';
import 'package:learning_app/pages/course/widgets/course_detail_widgets.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({Key? key}) : super(key: key);

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  late CourseDetailController _courseDetailController;
  // late CourseDetailController _courseDetailController; //part 6
  late var id;

  @override
  void initState() {
    super.initState();
    // var data = ModalRoute.of(context)!.settings.arguments as Map;
    // print(data.values);
  }

  //part 6
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _courseDetailController = CourseDetailController(context: context);
    _courseDetailController.init();
    id = ModalRoute.of(context)!.settings.arguments as Map;
    print(id.values.toString());
    // _courseDetailController = CourseDetailController(context: context);
    // _courseDetailController.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDetailBloc, CourseDetailStates>(
        builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar(),
            body: SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        thumbNail(state.courseItem!.thumbnail.toString()),
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
                       descriptionText(state.courseItem!.description.toString()),
                      ]),
                )
              ]),
            ),
          ),
        ),
      );
    });
  }
}
