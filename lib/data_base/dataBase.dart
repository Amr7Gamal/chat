import 'package:chat/model/message.dart';
import 'package:chat/model/my_user.dart';
import 'package:chat/model/room.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyDataBase {
  static CollectionReference<MyUser> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.collection)
        .withConverter<MyUser>(
            fromFirestore: (doc, _) => MyUser.formFirebase(doc.data()!),
            toFirestore: (user, _) => user.toFirebase());
  }

  static CollectionReference<Message> getMessageCollection(String roomId) {
    return FirebaseFirestore.instance
        .collection(Room.collection)
        .doc(roomId)
        .collection(Message.collectionName)
        .withConverter<Message>(
            fromFirestore: (doc, _) => Message.fromFirebase(doc.data()!),
            toFirestore: (message, _) => message.toFirebase());
  }

  static Future<MyUser?> insertUser(MyUser user) async {
    var collection = getUserCollection();
    var res = await (await collection.doc(user.id)).set(user);
    return user;
  }

  static Future<MyUser?> getUserById(String id) async {
    var collection = getUserCollection();
    var res = await collection.doc(id).get();
    return res.data();
  }

  static CollectionReference<Room> getRoomCollection() {
    return FirebaseFirestore.instance
        .collection(Room.collection)
        .withConverter<Room>(
            fromFirestore: (room, _) => Room.formFirebase(room.data()!),
            toFirestore: (room, _) => room.toFirebase());
  }

  static Future<void> createRoom(Room room) async {
    var docRef = getRoomCollection().doc();
    room.id = docRef.id;
    return docRef.set(room);
  }

  static Future<List<Room>> getRooms() async {
    var rooms = await getRoomCollection().get();
    return rooms.docs.map((rooms) => rooms.data()).toList();
  }

  static Future<List<Message>> getMessage(String id) async {
    var messages = await getMessageCollection(id).get();
    return messages.docs.map((doc) => doc.data()).toList();
  }

  static Future<void> sendMessage(Message message) {
    var messageDoc = getMessageCollection(message.roomId!).doc();
    message.id = messageDoc.id;
    return messageDoc.set(message);
  }
}
