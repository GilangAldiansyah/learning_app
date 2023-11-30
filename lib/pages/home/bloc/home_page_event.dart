import 'package:learning_app/common/entities/course.dart';
import 'package:learning_app/pages/home/home_page.dart';

abstract class HomePageEvents {
  const HomePageEvents();
}

class HomePageDots extends HomePageEvents {
  final int index;
  HomePageDots(this.index);
}

class HomePageCourseItem extends HomePageEvents {
  const HomePageCourseItem(this.courseItem);
  
  final List<CourseItem> courseItem;
}
