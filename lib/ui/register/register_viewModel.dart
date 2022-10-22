import 'package:chat/base/base.dart';
import 'package:chat/data_base/dataBase.dart';
import 'package:chat/model/my_user.dart';
import 'package:chat/sharedData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

abstract class RegisterNavigator extends BaseNavigator {
  login();

  void showHome();
}

class RegisterViewModel extends BaseViewModel<RegisterNavigator> {
  var authService = FirebaseAuth.instance;

  void register(TextEditingController email, TextEditingController password,
      TextEditingController userName, TextEditingController fullName) async {
    try {
      navigator?.showLoading(isCancelLabel: true);
      var user = await authService.createUserWithEmailAndPassword(
          email: email.text, password: password.text);

      MyUser newUser = MyUser(
        id: user.user?.uid,
        email: email.text,
        fullName: fullName.text,
        userName: userName.text,
      );

      var insertedUser = await MyDataBase.insertUser(newUser);
      navigator?.hideLoading();

      if (insertedUser != null) {
        SharedData.user = insertedUser;
        userName.clear();
        fullName.clear();
        email.clear();
        password.clear();
        navigator?.showHome();
      } else {
        navigator?.showMessage("Error");
      }
    } on FirebaseAuthException catch (e) {
      navigator?.hideLoading();
      navigator?.showMessage(e.message);
    }
  }

  void login() {
    navigator?.login();
  }
}
