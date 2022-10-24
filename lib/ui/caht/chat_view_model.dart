import 'package:chat/base/base.dart';
import 'package:chat/data_base/dataBase.dart';
import 'package:chat/model/message.dart';
import 'package:chat/sharedData.dart';
import 'package:flutter/material.dart';

import '../../model/room.dart';

abstract class ChatNavigator extends BaseNavigator {
}

class ChatViewModil extends BaseViewModel<ChatNavigator> {
  late Room room;

  void sent(TextEditingController content) {
    Message message = Message(
        content: content.text,
        dateTime: DateTime.now().millisecondsSinceEpoch,
        roomId: room.id,
        sendertId: SharedData.user!.id,
        senderName: SharedData.user!.fullName);
    MyDataBase.sendMessage(message)
        .then((value) => {content.clear()})
        .onError((error, stackTrace) => {});
  }
}
