import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            print("Berhasil Masuk");
            Global.storageService
                .setString(AppConstants.STORAGE_USER_TOKEN_KEY, "12345678");
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/application", (route) => false);
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
}
