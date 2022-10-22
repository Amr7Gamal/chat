import 'package:chat/base/base.dart';
import 'package:chat/data_base/dataBase.dart';
import 'package:chat/model/room.dart';

abstract class RoomAddNavigator extends BaseNavigator {
  getBack();
}

class RoomAddViewModel extends BaseViewModel<RoomAddNavigator> {
  void addRoom(String idCat, String name, String description) {
    navigator?.showLoading(text: "create Room ...");
    try {
      MyDataBase.createRoom(
          Room(idCat: idCat, name: name, description: description));
      navigator?.hideLoading();
      navigator?.showMessage("Done Create The Room", buttonTextOne: "Ok",
          buttonActionOne: () {
        navigator?.getBack();
      }, isCanceLable: false);
    } catch (e) {
      navigator?.hideLoading();
      navigator?.showMessage(e.toString());
    }
  }
}
