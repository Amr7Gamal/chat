import 'package:chat/MyTheme.dart';
import 'package:chat/register/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'chat',
      initialRoute: Register.nameKey,
      routes: {Register.nameKey: (_) => Register()},
      theme: MyTheme.lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
