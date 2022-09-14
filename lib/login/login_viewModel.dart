import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class LoginNotifier {
  void showLoding({String text = "Loding.."});

  void hideLoding();
//void showMessage();
}

class LoginViewModel extends ChangeNotifier {
  LoginNotifier? notifier;

  var authService = FirebaseAuth.instance;

  Future<void> loding(String email, String password) async {
    try {
      notifier?.showLoding();
      var user = await authService.signInWithEmailAndPassword(
          email: email, password: password);
      notifier?.hideLoding();
      //  notifier?.showMessage(message:  user.user?.uid ?? "");
    } on FirebaseAuthException catch (e) {
      notifier?.hideLoding();
      //  notifier?.showMessage( message: "There is an error in the password or email, try again");
    }
  }
}
