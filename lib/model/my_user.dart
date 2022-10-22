class MyUser {
  static const String collection = " users";

  String? id, fullName, userName, email;

  MyUser({this.id, this.userName, this.fullName, this.email});

  MyUser.formFirebase(Map<String, dynamic> date)
      : this(
          id: date["id"],
          fullName: date["fullName"],
          userName: date["userName"],
          email: date["email"],
        );

  Map<String, dynamic> toFirebase() {
    return {
      "id": id,
      "fullName": fullName,
      "userName": userName,
      "email": email
    };
  }
}
