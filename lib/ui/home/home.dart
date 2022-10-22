import 'package:chat/sharedData.dart';
import 'package:chat/ui/home/home_viewModel.dart';
import 'package:chat/ui/home/room_widget.dart';
import 'package:chat/ui/login/login.dart';
import 'package:chat/ui/room_add/room_add.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../base/base.dart';

class Home extends StatefulWidget {
  static const String nameKey = "home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends BaseState<Home, HomeViewModel>
    implements HomeNavigator {
  @override
  HomeViewModel initViewModel() {
    return HomeViewModel();
  }

  @override
  void initState() {
    super.initState();
    viewModel.getRooms();
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
              actions: [
                InkWell(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    SharedData.user = null;
                    Navigator.pushNamed(context, Login.nameKey);
                  },
                  child: Icon(Icons.logout),
                )
              ],
            ),
            body: Column(
              children: [
                Expanded(child: Consumer<HomeViewModel>(
                  builder: (buildContext, HomeViewModel, _) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8),
                      itemBuilder: (_, index) {
                        return RoomWidget(HomeViewModel.rooms[index]);
                      },
                      itemCount: HomeViewModel.rooms.length,
                    );
                  },
                ))
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showRoomAdd();
              },
              child: Icon(Icons.add),
            ),
          )),
    );
  }

  @override
  showRoomAdd() {
    Navigator.pushNamed(context, RoomAdd.nameKey);
  }

  @override
  setStateR() {
    setState(() {});
  }
}
