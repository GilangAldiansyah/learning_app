import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:learning_app/common/apis/user_api.dart';
import 'package:learning_app/common/entities/entities.dart';
import 'package:learning_app/common/values/constant.dart';
import 'package:learning_app/common/widgets/flutter_toast.dart';
import 'package:learning_app/global.dart';
import 'package:learning_app/pages/sign_in/bloc/sign_in_blocs.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          // print("email empty");
          toastInfo(msg: "You need to fill email address");
        } else {
          // print("email is $emailAddress");
          toastInfo(msg: "Login berhasil");
        }
        if (password.isEmpty) {
          print("password empty");
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            // print("user does not exist");
            toastInfo(msg: "You don't exist");
          }
          if (!credential.user!.emailVerified) {
            // print("not varied");
            toastInfo(msg: "You need to verify your email account");
          }

          var user = credential.user;
          if (user != null) {
            String? displayName = user.displayName;
            String? email = user.email;
            String? id = user.uid;
            String? photoUrl = user.photoURL;

            print("my url is ${photoUrl}");

            LoginRequestEntity loginRequestEntity = LoginRequestEntity();
            loginRequestEntity.avatar = photoUrl;
            loginRequestEntity.name = displayName;
            loginRequestEntity.email = email;
            loginRequestEntity.open_id = id;
            // type 1 means email login
            loginRequestEntity.type = 1;

            print("Berhasil Masuk");
            asyncPostAllData(loginRequestEntity);
          } else {
            // print("no user");
            toastInfo(msg: "Currently you are not a user of this app");
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print('No user found for that email.');
            toastInfo(msg: "No user found");
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided for that user');
            toastInfo(msg: "Wrong password for that user");
          } else if (e.code == 'invalid-email') {
            print("Your email format is wrong");
            toastInfo(msg: "Your email format is wrong");
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
      indicator: CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );

    var result = await UserApi.login(params: loginRequestEntity);
    if (result.code == 200) {
      try {
        Global.storageService.setString(
            AppConstants.STORAGE_USER_PROFILE_KEY, jsonEncode(result.data!));
            // token ini digunakan untuk authorization
        Global.storageService.setString(
            AppConstants.STORAGE_USER_TOKEN_KEY, result.data!.access_token!);
        EasyLoading.dismiss();
        Navigator.of(context)
            .pushNamedAndRemoveUntil("/application", (route) => false);
        print(result.data!.access_token!);
      } catch (e) {
        print('saving local storage error ${e.toString()}');
      }
    } else {
      EasyLoading.dismiss();
      toastInfo(msg: "unknown error");
    }
  }
}
