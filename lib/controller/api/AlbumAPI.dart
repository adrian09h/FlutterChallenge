import 'dart:convert';

import 'package:flutteralbum/model/AlbumModel.dart';
import 'package:flutteralbum/model/PhotoModel.dart';
import 'package:http/http.dart' as http;

final String baseUrl = "https://jsonplaceholder.typicode.com";

class AlbumAPI {
  static Future<List<AlbumModel>> getAlbums() async {
    var header = {"Content-Type": "application/json"};
    String url = "$baseUrl/albums";
    var response = await http.get(url, headers: header);
    if (response != null) {
      var dicRes = jsonDecode(response.body);
      if (dicRes is List) {
        List<dynamic> albums = dicRes;
        if (albums.length > 0) {
          return albums
              .map((e) => AlbumModel(e as Map<dynamic, dynamic>))
              .toList();
        }
      }
    }
    return [];
  }
  static Future<List<PhotoModel>> getPhotos(int albumId, {int page = 1, int perPage = 10}) async {
    var header = {"Content-Type": "application/json"};
    String url = "$baseUrl/photos?albumId=$albumId&page=$page&per_page=$perPage";
    var response = await http.get(url, headers: header);
    if (response != null) {
      var dicRes = jsonDecode(response.body);
      if (dicRes is List) {
        List<dynamic> photos = dicRes;
        if (photos.length > 0) {
          List array = photos
              .map((e) => PhotoModel(e as Map<dynamic, dynamic>))
              .toList();
          if ((page - 1) * perPage >= array.length) {
            return [];
          }
          return array.sublist((page - 1) * perPage, page * perPage > array.length ? array.length : page * perPage);
        }
      }
    }
    return [];
  }

}