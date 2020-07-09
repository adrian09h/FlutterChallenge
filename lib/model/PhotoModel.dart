class PhotoModel {
  int id;
  int albumId;
  String title;
  String url;
  String thumbnailUrl;
  PhotoModel(Map<dynamic, dynamic> dicData) {
    id = dicData["id"];
    albumId = dicData["albumId"];
    title = dicData["title"] ?? "";
    url = dicData["url"] ?? "";
    thumbnailUrl = dicData["thumbnailUrl"] ?? "";
  }
}