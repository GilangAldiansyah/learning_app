import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/entities/entities.dart';
import 'package:learning_app/common/routes/names.dart';
import 'package:learning_app/common/values/colors.dart';
import 'package:learning_app/pages/home/bloc/home_page_blocs.dart';
import 'package:learning_app/pages/home/bloc/home_page_states.dart';
import 'package:learning_app/pages/home/home_controller.dart';
import 'package:learning_app/pages/home/widgets/home_page_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController _homeController;
  late UserItem userProfile;

  @override
  void initState() {
    super.initState();
    _homeController = HomeController(context: context);
    _homeController.init();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userProfile = HomeController(context: context).userProfile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppbar(userProfile.avatar.toString()),
            body: BlocBuilder<HomePageBlocs, HomePageStates>(
                builder: (context, state) {

              return Container(
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
                child: CustomScrollView(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    slivers: [
                      SliverToBoxAdapter(
                        child: homePageText("Halo",
                            color: AppColors.primaryThreeElementText, top: 20),
                      ),
                      SliverToBoxAdapter(
                        child: homePageText(userProfile.name ?? "", top: 5),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.only(top: 20.h),
                      ),
                      SliverToBoxAdapter(
                        child: searchView(),
                      ),
                      SliverToBoxAdapter(
                        child: sliderView(context, state),
                      ),
                      SliverToBoxAdapter(
                        child: menuView(),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(
                            vertical: 18.h, horizontal: 0.w),
                        sliver: SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 15,
                                  childAspectRatio: 1.6),
                          delegate: SliverChildBuilderDelegate(
                            childCount: state.courseItem.length,
                            (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      AppRoutes.COURSE_DETAIL,
                                      arguments: {
                                        "id":
                                            state.courseItem.elementAt(index).id
                                      });
                                },
                                child: courseGrid(state.courseItem[index]),
                              );
                            },
                          ),
                        ),
                      )
                    ]),
              );
            }));
  }
}
