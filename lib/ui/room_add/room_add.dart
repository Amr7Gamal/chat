import 'package:chat/MyTheme.dart';
import 'package:chat/base/base.dart';
import 'package:chat/model/room_categories.dart';
import 'package:chat/ui/room_add/room_add_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoomAdd extends StatefulWidget {
  static const String nameKey = "room";

  @override
  State<RoomAdd> createState() => _RoomAddState();
}

class _RoomAddState extends BaseState<RoomAdd, RoomAddViewModel>
    implements RoomAddNavigator {
  List<RoomCategorise> roomCategorise = RoomCategorise.getRoomCategories();
  late RoomCategorise selectedRoomCategory;
  var formKey = GlobalKey<FormState>();
  var name = TextEditingController();
  var description = TextEditingController();

  @override
  RoomAddViewModel initViewModel() {
    selectedRoomCategory = roomCategorise[0];
    return RoomAddViewModel();
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
              body: SingleChildScrollView(
                child: Container(
                    margin: EdgeInsets.all(30),
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                        color: MyTheme.whiteColor,
                        borderRadius: BorderRadius.circular(18)),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                              padding: EdgeInsets.all(30),
                              child: Text(
                                "Create New Room",
                                style: Theme.of(context).textTheme.headline2,
                              )),
                          Image.asset("assets/images/room_add.png"),
                          SizedBox(
                            height: 14,
                          ),
                          TextFormField(
                            controller: name,
                            validator: (text) {
                              if (text!.trim().isEmpty || text == null) {
                                return "please Added Room Name";
                              }
                            },
                            decoration: InputDecoration(
                              label: Text("Enter Room Name"),
                            ),
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          DropdownButton<RoomCategorise>(
                              value: selectedRoomCategory,
                              items: roomCategorise.map((cat) {
                                return DropdownMenuItem<RoomCategorise>(
                                  value: cat,
                                  child: Row(children: [
                                    Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Image.asset(
                                          "assets/images/${cat.image}",
                                          width: 48,
                                          height: 48,
                                        )),
                                    Text(cat.name)
                                  ]),
                                );
                              }).toList(),
                              onChanged: (item) {
                                if (item != null)
                                  setState(() {
                                    selectedRoomCategory = item;
                                  });
                              }),
                          TextFormField(
                            controller: description,
                            validator: (text) {
                              if (text!.trim().isEmpty || text == null) {
                                return "please Added Room Description";
                              }
                            },
                            maxLines: 3,
                            minLines: 3,
                            decoration: InputDecoration(
                              label: Text("Enter Room Description"),
                            ),
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              create();
                            },
                            child: Text(
                              "Create",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: MyTheme.whiteColor),
                            ),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28))),
                            ),
                          )
                        ],
                      ),
                    )),
              ))),
    );
  }

  void create() {
    if (formKey.currentState?.validate() == false) return;
    viewModel.addRoom(selectedRoomCategory.id, name.text, description.text);
  }

  @override
  getBack() {}
}
