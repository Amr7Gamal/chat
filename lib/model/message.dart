class Message {
  static String collectionName = "message";
  String? id, content, senderName, sendertId, roomId;
  int? dateTime;

  Message(
      {this.id,
      this.content,
      this.senderName,
      this.sendertId,
      this.roomId,
      this.dateTime});

  Message.fromFirebase(Map<String, dynamic> date) {
    id = date["id"];
    content = date["content"];
    senderName = date["senderName"];
    sendertId = date["sendertId"];
    roomId = date["roomId"];
    dateTime = date["dateTime"];
  }

  Map<String, dynamic> toFirebase() {
    return {
      "id": id,
      "content": content,
      "senderName": senderName,
      "sendertId": sendertId,
      "roomId": roomId,
      "dateTime": dateTime,
    };
  }
}
