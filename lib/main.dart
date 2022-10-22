import 'package:chat/MyTheme.dart';
import 'package:chat/ui/caht/chat.dart';
import 'package:chat/ui/home/home.dart';
import 'package:chat/ui/login/login.dart';
import 'package:chat/ui/room_add/room_add.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'ui/register/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      initialRoute: Login.nameKey,
      routes: {
        Home.nameKey: (_) => Home(),
        Register.nameKey: (_) => Register(),
        Login.nameKey: (_) => Login(),
        RoomAdd.nameKey: (_) => RoomAdd(),
        Chat.nameKey: (_) => Chat()
      },
      theme: MyTheme.lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
