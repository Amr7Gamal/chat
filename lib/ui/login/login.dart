import 'package:chat/MyTheme.dart';
import 'package:chat/base/base.dart';
import 'package:chat/ui/login/login_viewModel.dart';
import 'package:chat/ui/register/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../home/home.dart';

class Login extends StatefulWidget {
  static String nameKey = "login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends BaseState<Login, LoginViewModel>
    implements LoginNavigator {
  var formKey = GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();
  bool pasowrdVisibility = true;

  @override
  LoginViewModel initViewModel() {
    return LoginViewModel();
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
                                login();
                              },
                              child: Text(
                                "Login",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(color: MyTheme.whiteColor),
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            register();
                          },
                          child: Text(
                            "Register",
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

  void login() {
    if (formKey.currentState!.validate() == false) {
      return;
    }
    viewModel.loding(email, password);
  }

  @override
  register() {
    Navigator.pushNamed(context, Register.nameKey);
  }

  @override
  void showHome() {
    Navigator.pushNamed(context, Home.nameKey);
  }

  @override
  void initState() {
    super.initState();
    viewModel.checkLoggedinUser();
  }
}
