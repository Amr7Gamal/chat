import 'package:chat/MyTheme.dart';
import 'package:chat/register/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
