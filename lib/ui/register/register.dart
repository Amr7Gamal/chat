import 'package:chat/MyTheme.dart';
import 'package:chat/base/base.dart';
import 'package:chat/ui/home/home.dart';
import 'package:chat/ui/login/login.dart';
import 'package:chat/ui/register/register_viewModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  static String nameKey = "register";

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends BaseState<Register, RegisterViewModel>
    implements RegisterNavigator {
  var formKey = GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();
  var userName = TextEditingController();
  var fullName = TextEditingController();

  bool pasowrdVisibility = true;

  @override
  RegisterViewModel initViewModel() {
    return RegisterViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Container(
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
                          controller: fullName,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return "Please Writing Name you";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: Text(
                              "Full Name",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: userName,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return "Please Writing User Name";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: Text(
                              "User Name",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ),
                        ),
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
                          obscureText: pasowrdVisibility,
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
                              suffixIcon: InkWell(
                                  onTap: () {
                                    pasowrdVisibility = !pasowrdVisibility;
                                    setState(() {});
                                  },
                                  child: Icon(pasowrdVisibility == true
                                      ? Icons.visibility
                                      : Icons.visibility_off))),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 2, vertical: 12),
                          child: ElevatedButton(
                              onPressed: () {
                                register();
                              },
                              child: Text(
                                "Register",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(color: MyTheme.whiteColor),
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            login();
                          },
                          child: Text(
                            "Login",
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )),
              ),
            )),
      ),
    );
  }

  var authService = FirebaseAuth.instance;

  void register() {
    if (formKey.currentState!.validate() == false) {
      return;
    }
    viewModel.register(email, password, userName, fullName);
  }

  @override
  login() {
    Navigator.pushNamed(context, Login.nameKey);
  }

  @override
  void showHome() {
    Navigator.pushNamed(context, Home.nameKey);
  }
}
