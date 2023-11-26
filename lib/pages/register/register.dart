import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/pages/common_widgets.dart';
import 'package:learning_app/pages/register/bloc/register_blocs.dart';
import 'package:learning_app/pages/register/bloc/register_events.dart';
import 'package:learning_app/pages/register/bloc/register_states.dart';
import 'package:learning_app/pages/register/register_controller.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBlocs, RegisterStates>(
        builder: (context, state) {
      return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.white,
                appBar: buildAppBar("Sign Up"),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Center(
                          child: reusableText(
                              "Atau gunakan akun anda untuk mendaftar")),
                      Container(
                        margin: EdgeInsets.only(top: 60.h),
                        padding: EdgeInsets.only(left: 25.w, right: 25.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            reusableText("Username"),
                            buildTextField(
                                "Enter your username", "name", "user", (value) {
                              context
                                  .read<RegisterBlocs>()
                                  .add(UserNameEvent(value));
                            }),
                            reusableText("Email"),
                            buildTextField("Enter your email", "email", "user",
                                (value) {
                              context
                                  .read<RegisterBlocs>()
                                  .add(EmailEvent(value));
                            }),
                            reusableText("Password"),
                            buildTextField(
                                "Enter your password", "password", "lock",
                                (value) {
                              context
                                  .read<RegisterBlocs>()
                                  .add(PasswordEvent(value));
                            }),
                            reusableText("Confirm Password"),
                            buildTextField(
                                "Confirm your password", "password", "lock",
                                (value) {
                              context
                                  .read<RegisterBlocs>()
                                  .add(RePasswordEvent(value));
                            })
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 12.w),
                        child: reusableText(
                            "Periksa kembali data yang anda masukan"),
                      ),
                      buildLogInAndRegButton("Sign up", "login", () {
                        // Navigator.of(context).pushNamed("register");
                        RegisterController(context: context)
                            .handleEmailRegister();
                      }),
                    ],
                  ),
                )),
          ));
    });
  }
}
