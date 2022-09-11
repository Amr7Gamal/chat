import 'package:chat/MyTheme.dart';
import 'package:chat/show.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static String nameKey = "login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var formKey = GlobalKey<FormState>();

  var email = TextEditingController();

  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Chat",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          body: Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .36,
                left: 20,
                right: 20),
            child: SingleChildScrollView(
              child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: email,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "Please Writing Email Address";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: Text(
                            "E-mail Address",
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: password,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "Please Writing Password";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: Text(
                            "Password",
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 12),
                        child: ElevatedButton(
                            onPressed: () {
                              register();
                            },
                            child: Text(
                              "Login",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(color: MyTheme.whiteColor),
                            )),
                      )
                    ],
                  )),
            ),
          )),
    );
  }

  var authService = FirebaseAuth.instance;

  void register() {
    if (formKey.currentState!.validate() == false) {
      return;
    }
    showLoading(context, "Loading .. .");
    authService
        .signInWithEmailAndPassword(email: email.text, password: password.text)
        .then((userCredential) {
      hideLoading(context);
      showMessage(context, (userCredential?.user) ?? "");
    }).onError((error, stackTrace) {
      hideLoading(context);
      showMessage(context, error.toString());
    });
  }
}
