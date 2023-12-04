import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/pages/profile/widgets/profil_widgets.dart';

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // late User user =
  //     User(name: "Gilang Aldiansyah", email: "gilangazharaldi@gmail.com");

  @override
  void initState() {
    super.initState();
    // Fetch user information here (e.g., from authentication service or database)
    // For example, you might use a provider or bloc to get the user data
    // user = User(name: "Gilang Aldiansyah", email: "gilangazharaldi@gmail.com");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppbar(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              profileIconAndEditButton(),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.w),
                child: buildListView(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
