import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/routes/pages.dart';
import 'package:learning_app/common/values/colors.dart';
import 'package:learning_app/global.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, hild) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: AppColors.primaryText),
                  elevation: 0,
                  backgroundColor: Colors.white)),
          onGenerateRoute: AppPages.GenerateRouteSettings,
        ),
      ),
    );
  }
}
