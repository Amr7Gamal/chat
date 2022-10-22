import 'package:chat/base/base.dart';
import 'package:chat/data_base/dataBase.dart';
import 'package:chat/sharedData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginNavigator extends BaseNavigator {
  register();

  void showHome();
}

class LoginViewModel extends BaseViewModel<LoginNavigator> {
  var auth = FirebaseAuth.instance;

  Future<void> loding(
      TextEditingController email, TextEditingController password) async {
    try {
      navigator?.showLoading(isCancelLabel: true);
      var user = await auth.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      var retrievedUser = await MyDataBase.getUserById(user.user!.uid);
      if (retrievedUser != null) {
        SharedData.user = retrievedUser;
        navigator?.hideLoading();
        email.clear();
        password.clear();

        navigator?.showHome();
      } else {
        navigator?.showMessage("It was not found on the user");
      }
    } on FirebaseAuthException catch (e) {
      navigator?.hideLoading();
      navigator?.showMessage(
          "There is an error in the password or email, try again");
    }
  }

  void register() {
    navigator?.register();
  }

  void checkLoggedinUser() async {
    if (auth.currentUser != null) {
      var retrievedUser = await MyDataBase.getUserById(auth.currentUser!.uid);
      SharedData.user = retrievedUser;
      navigator?.showHome();
    }
  }
}
