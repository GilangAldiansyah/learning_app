import 'package:learning_app/common/entities/course.dart';

abstract class CourseEvents {
  const CourseEvents();
}

class TriggerCourse extends CourseEvents {
  const TriggerCourse(this.courseItem) : super();
  final CourseItem courseItem;
}
