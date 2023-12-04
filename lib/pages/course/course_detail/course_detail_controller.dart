import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/apis/course_api.dart';
import 'package:learning_app/common/entities/course.dart';
import 'package:learning_app/common/widgets/flutter_toast.dart';
import 'package:learning_app/pages/course/course_detail/bloc/course_detail_blocs.dart';
import 'package:learning_app/pages/course/course_detail/bloc/course_detail_events.dart';

class CourseDetailController {
  final BuildContext context;

  CourseDetailController({required this.context});

  void init() async {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    print(args['id']);
    asyncLoadAllData(args["id"]);
  }

  asyncLoadAllData(int? id) async {
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;
    var result = await CourseApi.courseDetail(params: courseRequestEntity);

    if (result.code == 200) {
      if (context.mounted) {
        context.read<CourseDetailBloc>().add(TriggerCourseDetail(result.data!));
      } else {
        print('context is not available');
      }
    } else {
      toastInfo(msg: 'Terjadi kesalahan');
      print('Error code: ${result.code}');
    }
  }
}
