import 'package:chat/base/base.dart';
import 'package:chat/myTheme.dart';
import 'package:chat/ui/caht/message_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data_base/dataBase.dart';
import '../../model/message.dart';
import '../../model/room.dart';
import 'chat_view_model.dart';

class Chat extends StatefulWidget {
  static String nameKey = "chat";

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends BaseState<Chat, ChatViewModil>
    implements ChatNavigator {
  late Room room;
  var content = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    room = ModalRoute.of(context)?.settings.arguments as Room;
    viewModel.room = room;
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
                    room?.name ?? "",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                body: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 18,
                  margin: EdgeInsets.all(18),
                  color: MyTheme.whiteColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: Column(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.all(18),
                          child: StreamBuilder<QuerySnapshot<Message>>(
                              stream: MyDataBase.getMessageCollection(room.id!)
                                  .orderBy("dateTime", descending: true)
                                  .snapshots(),
                              builder: (buildContext, asyncSnapshot) {
                                if (asyncSnapshot.hasError) {
                                  return Center(
                                    child: Text("has error"),
                                  );
                                }
                                if (asyncSnapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: Text("Someting went wrong"),
                                  );
                                }

                                var data = asyncSnapshot.data?.docs
                                    .map((doc) => doc.data())
                                    .toList();

                                return ListView.separated(
                                  itemBuilder: (buildContext, index) {
                                    return MessageWidget(data![index]);
                                  },
                                  itemCount: data?.length ?? 0,
                                  reverse: true,
                                  separatorBuilder: (_, __) {
                                    return SizedBox(
                                      height: 18,
                                    );
                                  },
                                );
                              }),
                        )),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: content,
                                decoration: InputDecoration(
                                    hintText: "Sending Message"),
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  viewModel.sent(content.text);
                                },
                                child: Icon(Icons.send))
                          ],
                        )
                      ],
                    ),
                  ),
                ))));
  }

  @override
  ChatViewModil initViewModel() {
    return ChatViewModil();
  }

  @override
  contentClear() {
    content.clear();
  }
}
