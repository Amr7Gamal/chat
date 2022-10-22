import 'package:chat/base/base.dart';
import 'package:chat/data_base/dataBase.dart';

import '../../model/room.dart';

abstract class HomeNavigator extends BaseNavigator {
  showRoomAdd();

  setStateR();
}

class HomeViewModel extends BaseViewModel<HomeNavigator> {
  List<Room> rooms = [];

  void getRooms() async {
    rooms = await MyDataBase.getRooms();
    navigator!.setStateR();
  }
}
