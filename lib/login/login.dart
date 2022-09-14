import 'package:chat/MyTheme.dart';
import 'package:chat/login/login_viewModel.dart';
import 'package:chat/show.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  static String nameKey = "login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> implements LoginNotifier {
  var formKey = GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();
  late LoginViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = LoginViewModel();
    viewModel.notifier = this;
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
                                login();
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
      ),
    );
  }

  void login() {
    if (formKey.currentState!.validate() == false) {
      return;
    }
    viewModel.loding(email.text, password.text);
  }

/*
@override
  void showMessage({String? message}) {
    showMessage(context, message: message);
  }
  */
  @override
  void showLoding({String text = "Loding.."}) {
    showLoading(context, text);
  }

  @override
  void hideLoding() {
    hideLoding();
  }
}
