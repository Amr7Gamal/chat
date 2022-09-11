import 'package:chat/MyTheme.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  static String nameKey = "register";
  
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
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text(
                        "First Name",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text(
                        "User Name",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text(
                        "E-mail Address",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text(
                        "Password",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 12),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Register",
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
}
