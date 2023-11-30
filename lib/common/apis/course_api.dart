import 'package:learning_app/common/entities/course.dart';
import 'package:learning_app/common/utils/http_util.dart';

class CourseApi {
  static Future<CourseListResponseEntity> courseList() async {
    var response = await HttpUtil().post('api/courseList');
    print(response.toString());

    return CourseListResponseEntity.fromJson(response);
  }
}
