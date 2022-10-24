import 'package:chat/base/base.dart';
import 'package:chat/data_base/dataBase.dart';

import '../../model/room.dart';

abstract class HomeNavigator extends BaseNavigator {
  showRoomAdd();

}

class HomeViewModel extends BaseViewModel<HomeNavigator> {
List<Room> rooms = [];

  getRooms() async {
    rooms = await MyDataBase.getRooms();
    navigator!.setStateS();
  }
}
