import 'package:chat/format_date_time.dart';
import 'package:chat/myTheme.dart';
import 'package:chat/sharedData.dart';
import 'package:flutter/material.dart';

import '../../model/message.dart';

class MessageWidget extends StatelessWidget {
  Message message;

  MessageWidget(this.message);

  @override
  Widget build(BuildContext context) {
    return SharedData.user!.id == message.sendertId
        ? SentMessage(message.content!, message.dateTime!)
        : ReceivedMessage(
            message.content!, message.dateTime!, message.senderName!);
  }
}

class SentMessage extends StatelessWidget {
  String content;

  int dateTime;

  SentMessage(this.content, this.dateTime);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.all(4),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(18),
                  topLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18))),
          child: Text(
            content,
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        Text(formatDateTime(dateTime)),
      ],
    );
  }
}

class ReceivedMessage extends StatelessWidget {
  String content, senderMessage;

  int dateTime;

  ReceivedMessage(this.content, this.dateTime, this.senderMessage);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(senderMessage, style: Theme.of(context).textTheme.headline5),
        Container(
          margin: EdgeInsets.all(4),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color(0xF8F8F8),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(18),
                  topLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18))),
          child: Text(
            content,
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: MyTheme.blackColor),
          ),
        ),
        Text(formatDateTime(dateTime)),
      ],
    );
  }
}
