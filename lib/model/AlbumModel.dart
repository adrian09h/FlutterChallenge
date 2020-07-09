class AlbumModel {
  int id;
  int userId;
  String title;
  AlbumModel(Map<dynamic, dynamic> dicData) {
    id = dicData["id"];
    userId = dicData["userId"];
    title = dicData["title"] ?? "";
  }
}