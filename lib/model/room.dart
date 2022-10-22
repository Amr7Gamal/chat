class Room {
  static const String collection = "room";
  String? id, idCat, name, description;

  Room({this.id, this.idCat, this.name, this.description});

  Room.formFirebase(Map<String, dynamic> data)
      : this(
          id: data["id"],
          idCat: data["idCat"],
          name: data["name"],
          description: data["description"],
        );

  Map<String, dynamic> toFirebase() {
    return {"id": id, "idCat": idCat, "name": name, "description": description};
  }
}
