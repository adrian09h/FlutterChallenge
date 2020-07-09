import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutteralbum/model/PhotoModel.dart';

class PhotoDetailScreen extends StatefulWidget {
  final PhotoModel photo;
  const PhotoDetailScreen(this.photo);
  @override
  _PhotoDetailScreenState createState() => _PhotoDetailScreenState();
}

class _PhotoDetailScreenState extends State<PhotoDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Photo Detail"
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
        children: [
          CachedNetworkImage(
            imageUrl: widget.photo.url,
            fit: BoxFit.fitWidth,
            placeholder: (context, url) => CachedNetworkImage(
              imageUrl: widget.photo.thumbnailUrl,
              fit: BoxFit.fitWidth,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            widget.photo.title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
              fontSize: 20
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Album ID: ${widget.photo.albumId}",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),
          ),
          SizedBox(height: 8),
          Text(
            "ID: ${widget.photo.id}",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),
          ),
        ],
      ),
    );
  }
}
