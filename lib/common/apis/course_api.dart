import 'package:learning_app/common/entities/course.dart';
import 'package:learning_app/common/utils/http_util.dart';

class CourseApi {
  static Future<CourseListResponseEntity> courseList() async {
    var response = await HttpUtil().post('api/courseList');
    print(response.toString());

    return CourseListResponseEntity.fromJson(response);
  }

  static Future<CourseDetailResponseEntity> courseDetail(
      {CourseRequestEntity? params}) async {
    var response = await HttpUtil()
        .post('api/courseDetail', queryParameters: params?.toJson());
    print(response.toString());

    return CourseDetailResponseEntity.fromJson(response);
  }
}
