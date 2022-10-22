import 'package:chat/MyTheme.dart';
import 'package:chat/ui/caht/chat.dart';
import 'package:flutter/material.dart';

import '../../model/room.dart';

class RoomWidget extends StatelessWidget {
  Room room;

  RoomWidget(this.room);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Chat.nameKey, arguments: room);
      },
      child: Card(
        margin: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/images/${room.idCat}.png",
              width: 100,
              height: 100,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "${room.name}",
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: MyTheme.blackColor),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
