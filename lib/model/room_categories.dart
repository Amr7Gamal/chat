class RoomCategorise {
  String id, name, image;

  RoomCategorise({required this.id, required this.name, required this.image});

  static List<RoomCategorise> getRoomCategories() {
    return [
      RoomCategorise(id: "public", name: "Public", image: "public.png"),
      RoomCategorise(
          id: "technology", name: "Technology", image: "technology.png"),
      RoomCategorise(id: "sciences", name: "Sciences", image: "sciences.png")
    ];
  }
}
